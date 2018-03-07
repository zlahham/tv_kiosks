require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe 'validations' do
    before(:each) do
      allow_any_instance_of(Post).to receive(:expiry_cannot_be_in_past)
    end

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:category) }
    it { is_expected.to define_enum_for(:category).with(%i[Event News Video Emergency]) }
    it { is_expected.to validate_presence_of(:duration) }
    it { is_expected.to validate_presence_of(:expires_on) }

    it { is_expected.to validate_inclusion_of(:duration).in_range(5..60) }

    it { is_expected.to have_attached_file(:attachment) }
    it { is_expected.to validate_attachment_content_type(:attachment).allowing('image/jpeg', 'image/gif', 'image/png') }
  end
end
