# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubySC/version'

Gem::Specification.new do |spec|
  spec.name          = "rubySC"
  spec.version       = RubySC::VERSION
  spec.authors       = ["simdax"]
  spec.email         = ["simoncornaz@gmail.com"]
  spec.summary       = %q{light music live_coding lib}
  spec.description   = %q{}
  spec.homepage      = "http://github.com/simdax/rubySC"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  
  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~>0"

  spec.add_runtime_dependency "activesupport", "~>4.0"
  spec.add_runtime_dependency "osc-ruby", "~> 1.1"


end
