$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "social_rails/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "social_rails"
  s.version     = SocialRails::VERSION
  s.authors     = ["Francis G"]
  s.email       = ["francis@ixmedia.com"]
  s.homepage    = "https://github.com/ixmedia/social_rails"
  s.summary     = "Ease the pain of integrating social media posts in a Rails app."
  s.description = "Includes a configurable cache to keep your app from tipping over api limits."
  s.license     = "MIT"

  s.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", ">= 4.0"
  s.add_runtime_dependency 'koala', '~> 2.4'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'twitter', '>= 6.0.0', '~> 6.0'
end
