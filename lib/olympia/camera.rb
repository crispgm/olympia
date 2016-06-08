module Olympia

  class Camera

    PROTOCOL = 'http://'
    IP       = '192.168.0.10'
    POSTFIX  = '.cgi'

    require 'net/http'
    require 'rexml/document'

    def get(req, params = '')
      rawuri = PROTOCOL + IP + req + POSTFIX

      if params.length > 0
        rawuri += params
      end

      begin
        url = URI.parse(rawuri)
        http = Net::HTTP.new(url.host, url.port)
        http.read_timeout = 5
        http.open_timeout = 1
        http.add_field('User-Agent', 'OlympusCameraKit')
        http.add_field('Referer', '')

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
        
      # init list
      files_list = Array.new

      # parse list
      linelist.each do |line|
        sections = line.split(',')
        if sections.length != 6
          return 'Olympia: SECTION NUM ERROR'
        end
        files_list << sections
      end

      return files_list
    end

    def get_thumbnail(path)
      get('/get_thumbnail', 'DIR=' + path)
    end

    # get_caminfo
    # actually, it returns only a model name in the response body
    def get_caminfo
      xml = get('/get_caminfo')
      return xml if xml.eql? 'Olympia: NET ERROR'

      begin
        doc = REXML::Document.new xml
        return doc.root.elements['model'].text
      rescue
        return 'Olympia: XML ERROR'
      end
    end

    # get_connectmode
    def get_connectmode
      xml = get('/get_connectmode')
      return xml if xml.eql? 'Olympia: NET ERROR'

      begin
        doc = REXML::Document.new xml
        return doc.root.text
      rescue
        return 'Olympia: XML ERROR'
      end
    end

    # get_activate
    def get_activate
      xml = get('/get_activate')
      return xml if xml.eql? 'Olympia: NET ERROR'

      begin
        doc = REXML::Document.new xml
        return doc.root.text
      rescue
        return 'Olympia: XML ERROR'
      end
    end

    def get_gpsdivunit
      xml = get('/get_gpsdivunit')
      return xml if xml.eql? 'Olympia: NET ERROR'

      begin
        doc = REXML::Document.new xml
        return doc.root.text
      rescue
        return 'Olympia: XML ERROR'
      end
    end

    def get_unusedcapacity
      xml = get('/get_unusedcapacity')
      return xml if xml.eql? 'Olympia: NET ERROR'

      begin
        doc = REXML::Document.new xml
        return doc.root.text
      rescue
        return 'Olympia: XML ERROR'
      end
    end

    def get_dcffilenum
      xml = get('/get_dcffilenum')
      return xml if xml.eql? 'Olympia: NET ERROR'

      begin
        doc = REXML::Document.new xml
        return doc.root.text
      rescue
        return 'Olympia: XML ERROR'
      end
    end

    # power off
    def exec_pwoff
      get('/exec_pwoff')
    end

    # switch mode
    def switch_cammode(mode = 'play')
      get('/switch_cammode', 'mode=' + mode)
    end

    # shutter
    def exec_shutter(com)
      get('/exec_shutter', 'com=' + com)
    end
  end
end
