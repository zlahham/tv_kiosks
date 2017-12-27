require 'rails_helper'

RSpec.describe News, type: :model do
  let(:bbc_fake) { [Faker::Seinfeld.quote] }
  let(:eng_fake) { [Faker::Seinfeld.quote] }

  describe '.news_list' do
    it 'returns an Array of news items for Engineering' do
      allow(News).to receive(:news_list) { eng_fake }
      result = News.news_list('engineering_feed')

      expect(result).to eq(eng_fake)
    end

    xit 'returns an Array of news items for BBC news' do
      allow(News).to receive(:news_list) { bbc_fake }
      result = News.news_list('bbc_feed')

      expect(result).to eq(bbc_fake)
    end
  end

  describe '.news_string' do
  end
end
