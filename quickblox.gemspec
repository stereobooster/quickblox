# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'quickblox/version'

Gem::Specification.new do |spec|
  spec.name          = "quickblox"
  spec.version       = Quickblox.version
  spec.author        = "Robert Evans"
  spec.email         = "robert@codewranglers.org"
  spec.summary       = %q{Quickblox Api}
  spec.description   = %q{Access the Quickblox Api within a Rails application}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler",  "~> 1.7"
  spec.add_development_dependency "rake",     "~> 10.0"
  spec.add_development_dependency 'minitest'

  spec.add_dependency "railties", '~> 4.2.0.beta2'
  spec.add_dependency "faraday"
end
