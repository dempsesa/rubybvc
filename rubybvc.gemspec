Gem::Specification.new do |s|
  s.name        = 'rubybvc'
  s.version     = '0.3.0'
  s.date        = '2015-04-10'
  s.summary     = "Ruby BVC"
  s.description = "Ruby support library for Brocade Vyatta Controller (BVC) RESTCONF API"
  s.authors     = ["Elbrys Networks"]
  s.email       = 'support@elbrys.com'
  s.files       = Dir.glob("lib/**/*")
  s.homepage    = '' # github link
  s.license     = 'BSD'
  s.add_runtime_dependency "nokogiri", ["= 1.6.6.2"]
end