# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shoplo/api/version'

Gem::Specification.new do |spec|
  spec.name          = 'shoplo-api'
  spec.version       = Shoplo::Api::VERSION
  spec.authors       = ['Max Gulyaev']
  spec.email         = ['maxim@yotpo.com']
  spec.description   = %q{Ruby wrapper for shoplo API - written by Yotpo}
  spec.summary       = %q{Ruby wrapper for shoplo API - written by Yotpo}
  spec.homepage      = 'https://github.com/YotpoLtd/shoplo-api'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'

  spec.add_dependency 'oj', '~> 2.0'
  spec.add_dependency 'oauth'
end
