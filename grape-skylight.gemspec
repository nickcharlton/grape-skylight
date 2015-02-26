# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'grape-skylight/version'

Gem::Specification.new do |spec|
  spec.name          = 'grape-skylight'
  spec.version       = Skylight::Grape::VERSION
  spec.authors       = ['Nick Charlton']
  spec.email         = ['nick@nickcharlton.net']
  spec.summary       = 'Middleware for instrumenting Grape with Skylight.io.'
  spec.description   = 'Middleware for instrumenting Grape with Skylight.io.'
  spec.homepage      = 'https://github.com/nickcharlton/grape-skylight'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(test|spec|features)\//)
  end
  spec.require_paths = ['lib']

  spec.add_dependency 'grape'
  spec.add_dependency 'skylight'

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rack-test', '~> 0.6'
end
