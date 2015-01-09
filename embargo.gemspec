Gem::Specification.new do |s|
  s.name        = 'embargo'
  s.version     = '0.4.0'
  s.licenses    = ['MIT']
  s.required_ruby_version = '>= 2.1.2'
  s.summary     = "Embargo"
  s.description = "Embargo framework!"
  s.files       = Dir["lib/**/*"] + Dir["embargo/**/*"] + Dir["boilerplate/**/*"] + ["Rakefile", "README.md"]
  s.authors     = ["Eric Fleming", "Carson Wright", "Katie Harron"]
  s.email       = ['eric@traitify.com','carson@traitify.com', 'katie@traitify.com']
  s.homepage    = 'https://rubygems.org/gems/embargo'
  s.executables << 'embargo'
  s.add_runtime_dependency 'cuba', '= 3.3.0'
  s.add_runtime_dependency 'foreman', '= 0.76.0'
  s.add_runtime_dependency 'haml', '= 4.0.6'
  s.add_runtime_dependency 'sass', '= 3.4.9'
  s.add_runtime_dependency 'i18n', '= 0.6.11'
  s.add_runtime_dependency 'activesupport-inflector', '= 0.1.0'
  s.add_runtime_dependency 'rack-protection', '= 1.5.3'
  s.add_runtime_dependency 'unicorn', '= 4.8.3'
  s.add_development_dependency  'pry', '= 0.10.1'
  s.add_development_dependency  'rack-test', '= 0.10.1'
  s.add_runtime_dependency 'rb-fsevent', '= 0.9.4'
  s.add_runtime_dependency 'shotgun', '= 0.9'
  s.add_runtime_dependency 'thin', ' = 1.6.3'
  s.add_runtime_dependency 'rack-livereload', '= 0.3.15'
end