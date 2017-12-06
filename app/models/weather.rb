require 'httparty'

class Weather
  URL = "https://api.openweathermap.org/data/2.5/"\
	  "weather?id=2643743&units=metric&appid="\
	  "#{Rails.application.secrets.weather_app_id}".freeze
  response = HTTParty.get(URL)

  @@weather_data = response.parsed_response
  @@temperature = @@weather_data['main']['temp']

  def self.temperature
    @@temperature.to_i
  end

  def self.weather_icon
    icon_code = @@weather_data['weather'][0]['icon']
    weather_icon = case icon_code
                   when '01d'
                     '☀️'
                   when '01n', '02n'
                     '🌙'
                   when '02d'
                     '🌤'
                   when '03d', '03n', '04d', '04n'
                     '☁️'
                   when '09d', '09n', '10n'
                     '🌧'
                   when '10d'
                     '🌦'
                   when '11d', '11n'
                     '⛈'
                   when '13d', '13n'
                     '❄️'
                   when '50d', '50n'
                     '🌫'
                   end
    weather_icon
  end
end
