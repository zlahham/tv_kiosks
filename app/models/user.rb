class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable, :registrable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  enum role: %i[admin staff]

  has_many :posts

  validates :email, :password, :name, :role, presence: true

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
      field :last_sign_in_at
    end
  end
end
