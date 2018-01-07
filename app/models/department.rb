class Department < ApplicationRecord
  has_many :users

  validates :colour, :name, :code, presence: true
  validates :code, uniqueness: true
end
