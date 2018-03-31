class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registrable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :lockable

  enum role: %i[admin staff]

  belongs_to :department
  has_many :posts

  validates :email, :password, :name, :role, presence: true
  validates :feed_url, url: true, presence: false

  rails_admin do
    edit do
      group :default do
        label 'User information'
        help 'Please fill all information related to your user...'

        # field :name do
        #   label 'Title'
        # end
      end
    end

    list do
      field :name
      field :email
      field :role
      field :posts
      field :department
      field :feed_url
    end
  end
end
