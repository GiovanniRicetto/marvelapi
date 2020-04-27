require_relative '../common/structure.rb'

class GetCharacters < StructureCalls

    def initialize
        @timestamp = Time.now.to_i
        @hash = Digest::MD5.hexdigest("#{@timestamp}#{$auth["pvt"]}#{$auth["pub"]}")
    end

    def get_all_characters
        response = auth("get", "#{$env["base_url"]}/v1/public/characters", @timestamp, @hash)
    end

    def get_characters_information(characterid)
        response = auth("get", "#{$env["base_url"]}/v1/public/characters/#{characterid}", @timestamp, @hash)
    end
end
