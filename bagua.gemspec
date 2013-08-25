# encoding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bagua/version'

Gem::Specification.new do |spec|
  spec.name          = 'bagua'
  spec.version       = Bagua::VERSION
  spec.authors       = ['Scott Bai']
  spec.email         = ['hyperplanedrifter@gmail.com']
  spec.description   = 'Encodes plain text as sequences of trigrams or hexagrams.'
  spec.summary       = 'Trigram/hexagram encoder'
  spec.homepage      = 'http://github.com/sbai/bagua'
  spec.license       = 'MIT'
  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 10.0.3'
  spec.add_development_dependency 'yard', '~> 0.8.3'
  spec.add_development_dependency 'redcarpet', '~> 2.2.2'
  spec.add_development_dependency 'rspec', '~> 2.13.0'
end
