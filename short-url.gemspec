Gem::Specification.new do |s|
  s.name        = 'short-url'
  s.version     = '0.1.0'
  s.date        = '2012-11-22'
  s.summary     = "short url generator"
  s.description = "short-url plugin is using bit-shuffling algorithm to generate collision free unpredictable short urls"
  s.authors     = ["Muamer Ribica"]
  s.email       = 'muamer.ribica@gmail.com'
  s.files       = ["lib/short_url.rb", 
                   "lib/short_url/exceptions.rb", 
                   "lib/short_url/encoder.rb"]
  s.homepage    =
    'http://www.github.com/mribica/short-url'
  s.license       = 'MIT'
end
