# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rushover/cli/version'

Gem::Specification.new do |spec|
  spec.name          = "rushover-cli"
  spec.version       = Rushover::Cli::VERSION
  spec.authors       = ["brandonpittman"]
  spec.email         = ["brandonpittman@gmail.com"]
  spec.summary       = %q{A command-line interface for the rushover gem.}
  spec.description   = %q{A command-line interface for the rushover gem.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_dependency "slop", "~> 3.6"
end
