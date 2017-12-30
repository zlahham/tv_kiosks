require 'rails_helper'

RSpec.describe TFL, type: :model do
  let(:bakerloo_fake) { { "name"        =>"Bakerloo",
						  "lineStatuses"=>[{"statusSeverity"=>10,
                                            "statusSeverityDescription"=>"Good Service"}] } }
  let(:central_fake)  { { "name"        =>"Central",
						  "lineStatuses"=>[{"statusSeverity"=>10,
                                            "statusSeverityDescription"=>"Good Service"}] } }
  let(:circle_fake)   { { "name"        =>"Circle",
					 	  "lineStatuses"=>[{"statusSeverity"=>5,
                                            "statusSeverityDescription"=>"Part Closure"}] } }
  let(:district_fake) { { "name"        =>"District",
					 	  "lineStatuses"=>[{"statusSeverity"=>5,
                                            "statusSeverityDescription"=>"Part Closure"}] } }
  let(:response1_fake) { [bakerloo_fake, central_fake] }
  let(:response2_fake) { [bakerloo_fake, central_fake, circle_fake, district_fake] }

  describe '.disrupted_lines' do
    it 'returns an Array of all disrupted lines' do
      TFL.set_test_data(response2_fake)
      result = TFL.disrupted_lines
	  expect(result).to eq([circle_fake, district_fake])
	end
  end

  describe '.no_disruptions?' do
    it 'returns true if there no disruptions on any lines' do
      TFL.set_test_data(response1_fake)
	  result = TFL.no_disruptions?
	  expect(result).to eq(true)
	end

    it 'returns false if there are disruptions' do
      TFL.set_test_data(response2_fake)
	  result = TFL.no_disruptions?
	  expect(result).to eq(false)
	end
  end

  describe '.bad_service?' do
    it 'returns false if statusSeverity of line is 10 or above' do
	  result = TFL.bad_service?(bakerloo_fake)
	  expect(result).to eq(false)
	end

    it 'returns true if statusSeverity of line is less than 10 (bad)' do
	  result = TFL.bad_service?(circle_fake)
	  expect(result).to eq(true)
	end
  end

  describe '.line_name' do
    it 'returns the line name' do
	  result = TFL.line_name(bakerloo_fake)
	  expect(result).to eq('Bakerloo')
	end
  end
 
  describe '.line_status' do
    it 'returns the statusSeverityDescription of a line' do
	  result = TFL.line_status(bakerloo_fake)
	  expect(result).to eq('Good Service')
	end
  end

  describe '.line_status_id' do
    it 'returns the statusSeverity of a line' do
	  result = TFL.line_status_id(bakerloo_fake)
	  expect(result).to eq(10)
	end
  end
end
