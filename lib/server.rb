module Server

    require 'sinatra'

    class Server < Sinatra::Base
        get 'status' do
            "hello, world"
        end
    end

end
