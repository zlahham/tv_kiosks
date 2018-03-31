class Post < ApplicationRecord
  attr_accessor :delete_attachment
  MIN_DURATION = 5
  MAX_DURATION = 600

  belongs_to :user
  enum category: %i[Event News Video Emergency]

  has_attached_file :attachment,
                    styles: { small: '100x100>',
                              medium: '300x300>',
                              thumb: '100x100>' },
                    default_url: ''

  validates :title, :category, :duration, :date, :expires_on, presence: true
  validates :content, length: { maximum: 500 }
  validates :title, length: { maximum: 60 }
  validates :video_url, format: { with: /\A(http(s)?:\/\/)?((w){3}.)?youtu(be|.be)?(\.com)?\/.+/, message: 'must be a valid Youtube video URL'}, allow_blank: true
  validates :duration, inclusion: { in: MIN_DURATION..MAX_DURATION }
  validate :expiry_cannot_be_in_past, on: %i[create update]

  validates_attachment :attachment, content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
  validates_attachment :attachment, file_name: { matches: [/png\z/, /jpe?g\z/] }
  validates_with AttachmentSizeValidator, attributes: :attachment, less_than: 10.megabytes

  before_validation { attachment.clear if delete_attachment == '1' }

  after_commit :publish
  after_destroy :publish

  scope :valid, -> { where('expires_on >= :now AND date <= :now', now: Time.now) }
  scope :with_emergencies, -> { where(category: 'Emergency') }

  rails_admin do
    edit do
      group :default do
        label 'Post information'
        help 'Please fill all information related to your post...'
        field :user do
          label 'Author'
        end
        field :title do
          label 'Post Title'
        end
        field :content do
          label 'Post Content'
        end
        field :attachment do
          label 'Image'
        end
        field :category do
          label 'Post Category'
        end
        field :video_url do
          label 'Video URL'
        end
        field :duration do
          label 'Duration (Seconds)'
        end
        field :date do
          label 'Scheduled Date & Time'
        end
      end

      field :user
      field :title
      field :content, :wysihtml5 do
        config_options toolbar: {
          fa: true,
          image: false,
          'font-styles': false,
          color: true,
          emphasis: {
            small: false
          }
        }
      end
      field :attachment, :paperclip
      field :category
      field :video_url
      field :duration
      field :date
      field :expires_on
    end

    list do
      field :title
      field :user
      field :category
      field :video_url
      field :date
      field :duration
      field :expires_on

      group :default do
        field :user do
          label 'Author'
        end
        field :title do
          label 'Post Title'
        end
      end
    end
  end

  def self.fetch_feeds

    User.where.not(feed_url: '').each do |user|

      remote_contents = JSON.parse(open(user.feed_url).read)

      remote_contents.each do |post|

        # Skip posts that haven't happened since we last checked
        next if Time.parse(post["timestamp"]) < Time.now - 2.hours

        proposed_post = Post.new(title: post["title"], category: post["category"], duration: post["duration"], content: (post["content"] || nil), video_url: (post["video_url"] || nil), date: Time.parse(post["date"]), expires_on: Time.parse(post["expires_on"]))

        proposed_post.user_id = user.id

        puts proposed_post.inspect

        proposed_post.save!

      end

    end

  end

  private

  def publish
    ActionCable.server.broadcast('room_channel', post: self)
  end

  def expiry_cannot_be_in_past
    errors.add(:expires_on, ' cannot be in the past!') if expires_on < Time.now
  end
end
