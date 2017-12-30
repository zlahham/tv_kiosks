require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:content) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to define_enum_for(:category).with([:event, :news, :emergency]) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:expires_on) }

	it { is_expected.to validate_inclusion_of(:duration).in_range(5..30) }

	it { is_expected.to have_attached_file(:attachment) }
	it { is_expected.to validate_attachment_content_type(:attachment).
                allowing('image/jpeg', 'image/gif', 'image/png') }
  end
end
