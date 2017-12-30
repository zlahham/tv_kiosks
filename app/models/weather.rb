require 'httparty'

class Weather
  URL = 'https://api.openweathermap.org/data/2.5/weather?'\
        'id=2643743&units=metric&appid='\
        "#{Rails.application.secrets.weather_app_id}".freeze

  class << self
    @@weather_data = HTTParty.get(URL).parsed_response
    @@temperature = @@weather_data['main']['temp']

	def set_test_data(weather_data)
	  @@weather_data = weather_data
      @@temperature = @@weather_data['main']['temp']
	end

    def temperature
      @@temperature.to_i
    end

    def weather_icon
      icon_code = @@weather_data['weather'][0]['icon']
      find_icon(icon_code)
    end

    def find_icon(icon_code)
      case icon_code
      when '01d'                      then '☀️'
      when '01n', '02n'               then '🌙'
      when '02d'                      then '🌤'
      when '03d', '03n', '04d', '04n' then '☁️'
      when '09d', '09n', '10d', '10n' then '🌧'
      when '11d', '11n'               then '⛈'
      when '13d', '13n'               then '❄️'
      when '50d', '50n'               then '🌫'
      else
        ''
      end
    end
  end
end
