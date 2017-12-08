class TFL
  URL = 'https://api.tfl.gov.uk/line/mode/tube/status?'\
        "app_id=#{Rails.application.secrets.tfl_app_id}&"\
        "app_key=#{Rails.application.secrets.tfl_api_key}".freeze

  class << self
    @@response = HTTParty.get(URL).parsed_response

    def disrupted_lines
      @@response.each_with_object([]) do |line, acc|
        next unless bad_service?(line)
        acc << line
      end
    end

    def no_disruptions?
      disrupted_lines.blank?
    end

    def bad_service?(line)
      line['lineStatuses'][0]['statusSeverity'] < 11
    end

    def line_name(line)
      line['name']
    end

    def line_status(line)
      line['lineStatuses'][0]['statusSeverityDescription']
    end
  end
end