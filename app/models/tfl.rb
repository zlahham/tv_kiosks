class TFL
  URL = 'https://api.tfl.gov.uk/line/mode/tube/status?'\
        "app_id=#{Rails.application.secrets.tfl_app_id}&"\
        "app_key=#{Rails.application.secrets.tfl_api_key}".freeze

  class << self
    @@response = HTTParty.get(URL).parsed_response
    @@disruptions = {}

    def disruptions
      @@response.each do |line|
        next unless bad_service?(line)
        @@disruptions[line['id']] = "#{line_name(line)} Line: #{line_status(line)}"
      end

      @@disruptions.each_with_index.inject([]) do |acc, (disruption, index)|
        acc[index] = disruption[1]
      end
    end

    def no_disruptions?
      disruptions.blank?
    end

    def bad_service?(line)
      line['lineStatuses'][0]['statusSeverity'] < 10
    end

    def line_name(line)
      line['name']
    end

    def line_status(line)
      line['lineStatuses'][0]['statusSeverityDescription']
    end
  end
end
