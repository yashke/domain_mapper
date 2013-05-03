# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'domain_mapper/version'

Gem::Specification.new do |spec|
  spec.name          = "domain_mapper"
  spec.version       = DomainMapper::VERSION
  spec.authors       = ["Jan Filipowski"]
  spec.email         = ["jachuf@gmail.com"]
  spec.description   = %q{Map any hash to domain object using reflection.}
  spec.summary       = %q{Map any hash to domain object using reflection.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
