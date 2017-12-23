class Department < ApplicationRecord
  has_many :users

  validates :colour, :name, :code, presence: true
end
