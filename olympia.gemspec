require 'olympia/version'
Gem::Specification.new do |s|
    s.name          = 'olympia'
    s.version       = Olympia::VERSION
    s.date          = '2016-05-27'
    s.summary       = 'Hacks on Olympus Camera'
    s.description   = 'Hacks on Olympus Camera'
    s.authors       = ["David Zhang"]
    s.email         = 'crispgm@gmail.com'
    s.executables   = ["bin/olympia"]
    s.files         = ["bin/olympia", "lib/olympia.rb", "lib/olympia/version.rb", "lib/olympia/camera.rb"]
    s.homepage      = 'https://crisp.lol/page/olympia.html'
    s.license       = 'MIT'

    s.add_dependency "sinatra"
end
