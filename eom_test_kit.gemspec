Gem::Specification.new do |spec|
  spec.name          = 'eom_test_kit'
  spec.version       = '0.1.0'
  spec.authors       = ['Leap Orbit']
  spec.email         = ['ltucker@leaporbit.com']
  spec.date          = Time.now.utc.strftime('%Y-%m-%d')
  spec.summary       = 'EOM Inferno Test Kit'
  spec.description   = 'An Inferno Test Kit for the Enhancing Oncology Model IG'
  spec.homepage      = 'https://github.com/ljtucker/EOM-Inferno-Test-Kit'
  spec.license       = 'Apache-2.0'
  spec.add_runtime_dependency 'inferno_core', '~> 0.4.34'
  spec.add_development_dependency 'database_cleaner-sequel', '~> 1.8'
  spec.add_development_dependency 'factory_bot', '~> 6.1'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'webmock', '~> 3.11'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.1.2')
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/ljtucker/EOM-Inferno-Test-Kit'
  spec.files = [
    Dir['lib/**/*.rb'],
    Dir['lib/**/*.json'],
    'LICENSE'
  ].flatten

  spec.require_paths = ['lib']
end
