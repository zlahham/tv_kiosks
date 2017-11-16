class Post < ApplicationRecord
  MIN_DURATION = 5
  MAX_DURATION = 30

  belongs_to :user
  enum category: %i[event news]

  validates :title, :content, :category, :duration, :expires_on, presence: true
  validates :duration, inclusion: { in: MIN_DURATION..MAX_DURATION }
  validate :expiry_cannot_be_in_past, on: %i[create update]

  def expiry_cannot_be_in_past
    errors.add(:expires_on, ' cannot be in the past!') if expires_on < Time.now
  end
end
