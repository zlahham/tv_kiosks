require 'httparty'

class TFL
  url = 'https://api.tfl.gov.uk/line/mode/tube/status?app_id=00dbaeee&app_key=780a63dac025fb52d24aa41d645cd962'
  response = HTTParty.get(url)
  all_disruptions = response.parsed_response

  @disruptions = {}

  all_disruptions.each do |line|
    if line['lineStatuses'][0]['statusSeverity'] < 10
      @disruptions[line['id']] =
        line['lineStatuses'][0]['statusSeverityDescription'] +
        " on #{line['name']} line."
    end
  end

  def self.disruptions
    list = []
    @disruptions.each_with_index do |disruption, index|
      list[index] = disruption[1]
    end
    return list
  end
end
