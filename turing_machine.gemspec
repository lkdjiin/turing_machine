# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turing_machine/version'

Gem::Specification.new do |spec|
  spec.name          = "turing_machine"
  spec.version       = TuringMachine::VERSION
  spec.authors       = ["Xavier Nayrac"]
  spec.email         = ["xavier.nayrac@gmail.com"]
  spec.summary       = %q{A Turing machine}
  spec.description   = %q{A Turing machine that can run your instruction set}
  spec.homepage      = "http://lkdjiin.github.com/turing_machine/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1"
  spec.add_development_dependency "reek", "~> 1.6"
  spec.add_development_dependency "flay", "~> 2.6"
  spec.add_development_dependency "coco", "~> 0.12"
end
