$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "y_um_lme_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "y_um_lme_rails"
  s.version     = YUmLmeRails::VERSION
  s.authors     = ["Giuppo"]
  s.email       = ["romagiuppo@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of YUmLmeRails."
  s.description = "TODO: Description of YUmLmeRails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.2.1"

  s.add_development_dependency "sqlite3"
end
