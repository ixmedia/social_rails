$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ix_social/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ix_social"
  s.version     = IxSocial::VERSION
  s.authors     = ["Francis"]
  s.email       = ["fgoulet@ixmedia.com"]
  s.homepage    = "https://pacman.ixmedia.com/ixmedia/social-rails"
  s.summary     = "social rails ix."
  s.description = "social rails ix"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0.0"
  s.add_runtime_dependency 'koala', '~> 2.4'
  s.add_runtime_dependency 'httparty', '~> 0.13'

  s.add_development_dependency "sqlite3"
end
