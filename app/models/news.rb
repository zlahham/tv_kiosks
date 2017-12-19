include ActionView::Helpers::SanitizeHelper

class News
  BBC_URL = 'https://newsapi.org/v2/top-headlines?'\
    'sources=bbc-news&'\
    "apiKey=#{Rails.application.secrets.news_api_key}".freeze
  bbc_response = HTTParty.get(BBC_URL)
  bbc_news_hash = bbc_response.parsed_response
  bbc_articles = bbc_news_hash['articles']

  ENG_URL = 'https://api.rss2json.com/v1/api.json?'\
    'rss_url=http%3A%2F%2Fwww.engineering.ucl.ac.uk'\
    '%2Fnews-articles%2Ffeed%2F'.freeze
  eng_response = HTTParty.get(ENG_URL)
  eng_news_hash = eng_response.parsed_response
  eng_articles = eng_news_hash['items']

  @@bbc = { articles: bbc_articles,
            title_field_name: 'title',
            content_field_name: 'description' }
  @@engineering = { articles: eng_articles,
                    title_field_name: 'title',
                    content_field_name: 'content' }

  def self.news_list(news_feed)
    articles = case news_feed
      when 'engineering_feed' then @@engineering
      else
        @@bbc
               end

    title_delimiter = "\u2014"

    news_list = []
    articles[:articles].each do |article|
      title   = strip_tags(article[articles[:title_field_name].to_s])
      content = strip_tags(article[articles[:content_field_name].to_s])
      news_list << "#{title}#{title_delimiter}#{content}"
    end
    news_list
  end

  def self.news_string(news_feed)
    item_delimiter = "\u2001" * 10
    news_list(news_feed).each_with_index.inject('') do |acc, (item, index)|
      acc << if index < (news_list(news_feed).size - 1)
               "#{item}#{item_delimiter}"
             else
               item.to_s
             end
    end
  end
end
