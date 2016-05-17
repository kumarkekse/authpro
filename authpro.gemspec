$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "authpro/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "authpro"
  s.version     = Authpro::VERSION
  s.authors     = ["AS kumar"]
  s.email       = ["ashishkckse@gmail.com"]
  s.homepage    = "https://github.com/kumarkekse/authpro"
  s.summary     = "Simple Rails authentication generator"
  s.description = "Simple Rails authentication generator"
  s.license = 'MIT'
  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.1.0"
  s.add_dependency "bcrypt", "~> 3.1.7"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "capybara"
  s.add_development_dependency "database_cleaner", "~> 1.2.0"
  s.add_development_dependency "timecop"
end
