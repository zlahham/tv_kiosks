require 'rails_helper'

RSpec.describe Department, type: :model do
  describe 'associations' do
    it { is_expected.to have_many(:users) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:colour) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:code) }
  end
end
