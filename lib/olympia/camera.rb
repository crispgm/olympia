module Olympia

    class Camera

        PROTOCOL = 'http://'
        IP       = '192.168.0.10'

        require 'net/http'

        def get(req, params = '')
            if params.length > 0
                rawuri = PROTOCOL + IP + req + '.cgi' + '?' + params
            else
                rawuri = PROTOCOL + IP + req + '.cgi'
            end

            begin
                url = URI.parse(rawuri)
                http = Net::HTTP.new(url.host, url.port)
                http.read_timeout = 5
                http.open_timeout = 1
                resp = http.start() {|http|
                    http.get(url.path)
                }
                resp.body
            rescue
                'Olympia: NET ERROR'
            end
        end

        def get_imglist(path = '/DCIM')
            get('/get_imglist', 'DIR=' + path)
        end

        def parse_list(body)
            # parse mark on top of body
            if body.start_with?("VER_100")
                rawlist = body[8, body.length]
                linelist = rawlist.split("\n")
            else
                return 'Olympia: NO BODY MARK'
            end
            # parse list
            linelist.each do |line|
                sections = line.split(',')
                if sections.length != 6
                    return 'Olympia: SECTION NUM ERROR'
                end
                sections.each do |section|
                    puts section
                end
            end
        end

        def get_thumbnail(path)
            get('/get_thumbnail', 'DIR=' + path)
        end

        # get_caminfo
        # actually, it returns only a model name in the response body
        def get_caminfo
            get('/get_caminfo')
        end
    end
end
