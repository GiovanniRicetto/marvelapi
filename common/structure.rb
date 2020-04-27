require_relative "../spec/spec_helper.rb"

class StructureCalls

    def auth(method, url, timestamp, hash)
        response = HTTParty.send(method, url,
            :query => {:ts => timestamp,
                        :apikey => $auth["pub"],
                        :hash => hash})
    end

end