require 'rails_helper'

RSpec.describe Weather, type: :model do
  let(:weather_data_fake) { {"weather" => [{"icon" => "01d"}],
                             "main"    => {"temp" => 11.66 } } }

  describe '.temperature' do
    it 'returns temperature as an integer' do
      Weather.set_test_data(weather_data_fake)
	  result = Weather.temperature
	  expect(result).to eq(11)
	end
  end

  describe '.weather_icon' do
    it 'returns an icon corresponding to the weather data icon code' do
      Weather.set_test_data(weather_data_fake)
	  result = Weather.weather_icon
	  expect(result).to eq('☀️')
	end
  end
end
