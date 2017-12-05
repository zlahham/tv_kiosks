include ActionView::Helpers::SanitizeHelper

require 'httparty'

class News
  #BBC top headlines from newsAPI
  bbc_url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=#{Rails.application.secrets.news_api_key}"
  bbc_response = HTTParty.get(bbc_url)
  bbc_news_hash = bbc_response.parsed_response
  @@bbc_articles = bbc_news_hash['articles']

  #UCL Faculty of Engineering RSS feed
  eng_url = "https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fwww.engineering.ucl.ac.uk%2Fnews-articles%2Ffeed%2F"
  eng_response = HTTParty.get(eng_url)
  eng_news_hash = eng_response.parsed_response
  @@eng_articles = eng_news_hash['items']
  
  #insert mdash between news item title and news item description
  @@delimiter = "\u2014"

  def self.bbc_news_list
	news_list = Array.new
	@@bbc_articles.each do |article|
      news_list << "#{article['title']}#{@@delimiter}#{article['description']}"
    end
    return news_list
  end

  def self.engineering_news_list
	news_list = Array.new
	@@eng_articles.each do |article|
	  title = strip_tags(article['title'])
	  #issue: the 'description' fields in the feed finish mid-sentence,
	  #with an ellipsis and a "continue reading";
	  #the 'content' fields are far too long
	  description = strip_tags(article['content'])
      news_list << "#{title}#{@@delimiter}#{description}"
    end
    return news_list
  end
end
