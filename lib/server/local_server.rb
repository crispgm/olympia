module Server

    require 'sinatra'
    class LocalServer
        def handle
            get 'status' do
                "hello, world"
            end
        end
    end

end
