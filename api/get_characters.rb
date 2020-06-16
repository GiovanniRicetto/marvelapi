require_relative '../common/structure.rb'

class GetCharacters < StructureCalls

    def initialize
        @timestamp = Time.now.to_i
        @hash = Digest::MD5.hexdigest("#{@timestamp}#{$auth["pvt"]}#{$auth["pub"]}")
    end

    def get_all_characters
        response = auth("get", "#{$env["base_url"]}/v1/public/characters", @timestamp, @hash)
    end

    def get_character
        response = callingcharacter("get", "#{$env["base_url"]}/v1/public/characters", @timestamp, @hash)
    end
    
    def get_characterseries_information(hulkid, serieid)
        response = auth2("get", "#{$env["base_url"]}/v1/public/characters/#{hulkid}/series", @timestamp, @hash, serieid)
    end
end
