class Department < ApplicationRecord
  has_many :users
  has_many :screens

  validates :colour, :name, :code, presence: true
  validates :code, uniqueness: true
  validates :twitter_handle, format: { with: /\A[A-Za-z0-9_]{1,15}\z/, message: 'must be a valid Twitter username'}

  validates :colour, format: { with: /(?<=#)(?<!^)\h{6}/, message: 'only allows colour hexidecimal e.g. #6D979A' }
end
