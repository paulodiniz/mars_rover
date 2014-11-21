# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mars_rover/version'

Gem::Specification.new do |spec|
  spec.name          = "mars_rover"
  spec.version       = MarsRover::VERSION
  spec.authors       = ["Paulo Diniz"]
  spec.email         = ["paulodiniz@gmail.com"]
  spec.summary       = %q{Mars Landing Rover solution}
  spec.description   = %q{Solving the Thoughtworks Mars Landing Rover problem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "activesupport"
  spec.add_development_dependency "pry"
end
