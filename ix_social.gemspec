Gem::Specification.new do |s|
  s.add_runtime_dependency 'rails', '>= 4.0'
  s.add_runtime_dependency 'koala', '~> 2.4'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  
  s.name        = "ix_social"
  s.version     = "0.0.1"
  s.date        = "2016-11-22"
  s.summary     = "Social module"
  s.description = "Display facebook, instagram and twitter feeds"
  s.authors     = ["Francis Goulet"]
  s.email       = "goulet.francis@gmail.com"
  s.files       = Dir["{lib, vendor}/**/*"]
  s.homepage    = "https://github.com/francisgt"
  s.license     = "MIT"
end
