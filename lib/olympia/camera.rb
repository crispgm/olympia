module Olympia

    class Camera
        PROTOCOL = 'http://'
        IP       = '192.168.0.10'

        require 'net/http'

        def makeRequest(req)
            return PROTOCOL + IP + req
        end

        def self.getPhotoList
            uri = URI.parse(makeRequest('get_rsvimglist'))
            resp = Net::HTTP.get_response(uri)
            resp.body
        end

        def self.getCamInfo
        end
    end

end
