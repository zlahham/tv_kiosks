require 'rails_helper'

RSpec.describe News, type: :model do
  let(:bbc_fake) { [Faker::Seinfeld.quote] }
  let(:eng_fake) { [Faker::Seinfeld.quote] }

  describe '.news_list' do
    it 'returns an Array of news items for Engineering' do
      allow(News).to receive(:news_list).with('engineering_feed') { eng_fake }
      result = News.news_list('engineering_feed')
      expect(result).to eq(eng_fake)
    end

    it 'returns an Array of news items for BBC news' do
      allow(News).to receive(:news_list).with('bbc_feed') { bbc_fake }
      result = News.news_list('bbc_feed')
      expect(result).to eq(bbc_fake)
    end
  end

  describe '.news_string' do
    it 'returns a string of news items for a given news feed' do
      allow(News).to receive(:news_list).with('feed') { %w[item1 item2 item3] }
      result = News.news_string('feed')
      i_d = "\u2001" * 2 + '+' * 3 + "\u2001" * 2
      expect(result).to eq("item1#{i_d}item2#{i_d}item3#{i_d}")
    end
  end
end
