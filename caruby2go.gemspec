# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caruby2go/version'

Gem::Specification.new do |spec|
  spec.name          = "caruby2go"
  spec.version       = Caruby2go::VERSION
  spec.authors       = ["Eric Ebbesen"]
  spec.email         = ["eebbesen.git@gmail.com"]
  spec.summary       = %q{Ruby gem for car2go API}
  spec.description   = %q{Ruby gem for car2go API}
  spec.homepage      = "https://github.com/eebbesen/caruby2go"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  # rspec
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-nc"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-remote"
  spec.add_development_dependency "pry-nav"
  spec.add_development_dependency "spy"
  spec.add_development_dependency "thor"
end
