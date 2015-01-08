# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "redcarpet/abbreviations/version"

Gem::Specification.new do |spec|
  spec.name          = "redcarpet-abbreviations"
  spec.version       = Redcarpet::Abbreviations::VERSION
  spec.authors       = ["Brandon Weiss"]
  spec.email         = ["brandon@anti-pattern.com"]
  spec.summary       = %q{An extension for Redcarpet that supports abbreviations.}
  spec.description   = %q{An extension for Redcarpet that supports abbreviations.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake",    "~> 10.0"
end
