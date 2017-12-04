require 'httparty'

class News
  url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=#{Rails.application.secrets.news_api_key}"
  response = HTTParty.get(url)
  newshash = response.parsed_response
  @@articles = newshash['articles']
  
  def self.newslist
	newslist = Array.new
	@@articles.each do |article|
      newslist << "#{article['title']}\u2014#{article['description']}"
    end
    return newslist
  end
end
