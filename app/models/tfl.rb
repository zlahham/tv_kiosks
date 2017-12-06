require 'httparty'

class TFL
  url = "https://api.tfl.gov.uk/line/mode/tube/status?app_id=#{Rails.application.secrets.tfl_app_id}&app_key=#{Rails.application.secrets.tfl_api_key}"
  response = HTTParty.get(url)
  all_disruptions = response.parsed_response

  @@disruptions = {}

  all_disruptions.each do |line|
    if line['lineStatuses'][0]['statusSeverity'] < 10
      @@disruptions[line['id']] =
        line['name'] + ' Line: ' + line['lineStatuses'][0]['statusSeverityDescription']
    end
  end

  def self.disruptions
    list = []
    @@disruptions.each_with_index do |disruption, index|
      list[index] = disruption[1]
    end
    return list
  end

  def self.no_disruptions
    disruption_list = self.disruptions
    return disruption_list.blank?
  end
end
