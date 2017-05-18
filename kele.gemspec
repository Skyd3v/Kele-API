Gem::Specification.new do |s|
  s.name          = 'kele'
  s.version       = '0.0.1'
  s.date          = '2016-07-12'
  s.summary       = 'Kele API Client'
  s.description   = 'A client for the Bloc API'
  s.authors       = ['Alex Anthopoulos']
  s.email         = 'a.anthopoulos01@gmail.com'
  s.files         = `git ls-files`.split($/)
  s.require_paths = ["lib/kele.rb'"]
  s.homepage      =
    'http://rubygems.org/gems/kele'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
end
