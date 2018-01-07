class Department < ApplicationRecord
  has_many :users

  validates :colour, :name, :code, presence: true
  validates :code, uniqueness: true

  validates :colour, format: { with: /(?<=#)(?<!^)\h{6}/, message: 'only allows colour hexidecimal e.g. #6D979A' }
end
