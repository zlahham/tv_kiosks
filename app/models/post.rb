class Post < ApplicationRecord
  MIN_DURATION = 5
  MAX_DURATION = 30

  belongs_to :user
  enum category: %i[event news]

  has_attached_file :attachment,
                    styles: {
                      small: '100x100>',
                      medium: '300x300>',
                      thumb: '100x100>'
                    },
                    default_url: '/images/:style/missing.png'

  validates :title, :content, :category, :duration, :expires_on, presence: true
  validates :duration, inclusion: { in: MIN_DURATION..MAX_DURATION }
  validate :expiry_cannot_be_in_past, on: %i[create update]
  validates_attachment :attachment, content_type: { content_type: ['image/jpeg', 'image/gif', 'image/png'] }
  validates_attachment :attachment, file_name: { matches: [/png\z/, /jpe?g\z/] }

  def expiry_cannot_be_in_past
    errors.add(:expires_on, ' cannot be in the past!') if expires_on < Time.now
  end

  rails_admin do
    # parent User

    edit do
      group :default do
        label 'Post information'
        help 'Please fill all information related to your post...'
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
      field :date
      field :category
      field :duration
      field :expires_on
      field :attachment, :paperclip
    end

    list do
      field :title
      field :user
      field :category
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

    object_label_method do
      :post_label_method
    end
  end

  def post_label_method
    "Post ##{id}"
  end
end
