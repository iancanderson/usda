require File.expand_path('../lib/usda/version', __FILE__)

Gem::Specification.new do |s|
 s.name        = "usda"
 s.version     = Usda::VERSION
 s.authors     = ["Ian C. Anderson"]
 s.email       = ["anderson.ian.c@gmail.com"]

 s.summary     = "USDA on Rails"
 s.description = "Provides models to interact with Usda data, rake tasks to import Usda data"
 s.homepage    = "http://github.com/iancanderson/usda"

 s.files       = Dir.glob("lib/**/*.rb")
end

