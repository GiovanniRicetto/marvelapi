require_relative '../common/structure.rb'

class GetSeries < StructureCalls

    def initialize
        @timestamp = Time.now.to_i
        @hash = Digest::MD5.hexdigest("#{@timestamp}#{$auth["pvt"]}#{$auth["pub"]}")
    end

    def get_all_series
        response = auth("get", "#{$env["base_url"]}/v1/public/series", @timestamp, @hash)
    end

    def get_serie
        response = callingserie("get", "#{$env["base_url"]}/v1/public/series", @timestamp, @hash)
    end

    def get_series_information(seriesid)
        response = auth("get", "#{$env["base_url"]}/v1/public/series/#{seriesid}", @timestamp, @hash)
    end
end
