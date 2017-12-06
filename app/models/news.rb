include ActionView::Helpers::SanitizeHelper

require 'httparty'

class News
  #BBC top headlines from newsAPI
  BBC_URL = "https://newsapi.org/v2/top-headlines?"\
	  	    "sources=bbc-news&"\
			"apiKey=#{Rails.application.secrets.news_api_key}".freeze
  bbc_response = HTTParty.get(BBC_URL)
  bbc_news_hash = bbc_response.parsed_response
  bbc_articles = bbc_news_hash['articles']

  #UCL Faculty of Engineering RSS feed
  ENG_URL = "https://api.rss2json.com/v1/api.json?"\
  			"rss_url=http%3A%2F%2Fwww.engineering.ucl.ac.uk"\
			"%2Fnews-articles%2Ffeed%2F".freeze
  eng_response = HTTParty.get(ENG_URL)
  eng_news_hash = eng_response.parsed_response
  eng_articles = eng_news_hash['items']
  
  @@bbc = { articles: bbc_articles, title_field_name: "title",
		  content_field_name: "description" }
  @@engineering = { articles: eng_articles, title_field_name: "title",
		  content_field_name: "content" }

  def self.news_list(news_feed)
	case news_feed
	when "bbc_feed"
	  articles = @@bbc
	when "engineering_feed"
	  articles = @@engineering
	end
	
    #insert mdash between news item title and news item content
	title_delimiter = "\u2014"

	news_list = Array.new
	articles[:articles].each do |article|
      title   = strip_tags(article["#{articles[:title_field_name]}"])
      content = strip_tags(article["#{articles[:content_field_name]}"])
      news_list << "#{title}#{title_delimiter}#{content}"
    end
	news_list
  end

  def self.news_string(news_feed)
    #insert whitespace between news items
	item_delimiter = "\u2001" * 10

	news_string = ""
    self.news_list(news_feed).each_with_index do |item, index|
	  if index < (news_list(news_feed).size - 1)
	    news_string += "#{item}#{item_delimiter}"
	  else
	    news_string += "#{item}"
	  end
	end
	news_string
  end
end
