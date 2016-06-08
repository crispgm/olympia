$:.unshift File.expand_path("../lib", __FILE__)
require 'olympia/version'

Gem::Specification.new do |s|
  s.name          = 'olympia'
  s.platform      = Gem::Platform::RUBY
  s.version       = Olympia::VERSION
  s.date          = '2016-05-27'
  s.summary       = 'Olympia: Olympus(R) Camera Manager on Wi-Fi Mode'
  s.description   = 'Olympia provides a web UI to manage the pics between camera and your computer'
  s.authors       = ["David Zhang"]
  s.email         = 'crispgm@gmail.com'
  s.homepage      = 'https://crisp.lol/page/olympia.html'
  s.license       = 'MIT'

  s.required_ruby_version     = '>= 2.0.0'
  s.required_rubygems_version = '>= 1.3.6'

  s.add_dependency 'sinatra'
  s.add_development_dependency 'minitest'
  s.add_development_dependency 'webmock'

  all_files = `git ls-files -z`.split("\x0")
  all_files.select! {|file| file.start_with?('bin/') || file.start_with?('lib/') || file.start_with?('public/') || file.start_with?('templates/') || file.start_with?('tests/')}
  s.files         = all_files
  s.executables   = ['olympia']
  s.require_path  = 'lib'
  
end
