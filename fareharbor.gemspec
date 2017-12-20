# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fareharbor/version'

Gem::Specification.new do |spec|
  spec.name          = 'fareharbor'
  spec.version       = Fareharbor::VERSION
  spec.authors       = ['Brian Getting']
  spec.email         = ['brian@tatem.ae']
  spec.summary       = %q{A Ruby gem for interacting with the FareHarbor API.}
  spec.description   = %q{A Ruby gem for interacting with the FareHarbor API.}
  spec.homepage      = 'TODO: Public repo URL here.'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'multi_json'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'webmock'

  spec.add_dependency 'spyke'
  spec.add_dependency 'faraday'
  spec.add_dependency 'faraday_middleware'
  spec.add_dependency 'multi_json'
end
