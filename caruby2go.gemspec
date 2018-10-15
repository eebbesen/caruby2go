# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caruby2go/version'

Gem::Specification.new do |spec|
  spec.name          = 'caruby2go'
  spec.version       = Caruby2go::VERSION
  spec.authors       = ['Eric Ebbesen']
  spec.email         = ['eebbesen.git@gmail.com']
  spec.summary       = 'Ruby gem that wraps the car2go API'
  spec.description   = 'Ruby gem that wraps the car2go API -- only supports the public API at present'
  spec.homepage      = 'https://github.com/eebbesen/caruby2go'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0'

  spec.add_dependency 'thor'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rake'

  # test
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-remote'
  spec.add_development_dependency 'pry-nav'
  spec.add_development_dependency 'spy'
  spec.add_development_dependency 'byebug'
  spec.add_development_dependency 'bundle-audit'
end
