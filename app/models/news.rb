include ActionView::Helpers::SanitizeHelper

require 'httparty'

class News
  url = "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=#{Rails.application.secrets.news_api_key}"
  response = HTTParty.get(url)
  newshash = response.parsed_response

  url2 = "https://api.rss2json.com/v1/api.json?rss_url=http%3A%2F%2Fwww.engineering.ucl.ac.uk%2Fnews-articles%2Ffeed%2F"
  response2 = HTTParty.get(url2)
  newshash2 = response2.parsed_response

  @@articles = newshash['articles']
  @@articles2 = newshash2['items']
  
  def self.newslist
	newslist = Array.new
	@@articles.each do |article|
      newslist << "#{article['title']}\u2014#{article['description']}"
    end
    return newslist
  end
  def self.newslist2
	newslist = Array.new
	@@articles2.each do |article|
      newslist << "#{article['title']}\u2014#{strip_tags(article['description'])}"
    end
    return newslist
  end
end
