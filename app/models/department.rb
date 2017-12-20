class Department < ApplicationRecord
  has_many :users

  validates :colour, :name, presence: true
end
