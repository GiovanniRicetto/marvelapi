require_relative "../spec/spec_helper.rb"

class StructureCalls

    def auth(method, url, timestamp, hash)
        response = HTTParty.send(method, url,
            :query => {:ts => timestamp,
                        :apikey => $auth["pub"],
                        :hash => hash,
                        :limit => 100}
                        )
    end

    def auth2(method, url, timestamp, hash, serieid)
        response = HTTParty.send(method, url,
            :query => {:ts => timestamp,
                        :apikey => $auth["pub"],
                        :hash => hash,
                        :id => serieid})
    end

    def callingcharacter(method, url, timestamp, hash)
        response = HTTParty.send(method, url,
            :query => {:ts => timestamp,
                        :apikey => $auth["pub"],
                        :hash => hash,
                        :name => $env["character"]}
                    )
    end

    def callingserie(method, url, timestamp, hash)
        response = HTTParty.send(method, url,
            :query => {:ts => timestamp,
                        :apikey => $auth["pub"],
                        :hash => hash,
                        :title => $env["serie"]}
                    )
    end
end