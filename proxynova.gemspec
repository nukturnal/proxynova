# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'proxynova/version'

Gem::Specification.new do |spec|
  spec.name          = "proxynova"
  spec.version       = Proxynova::VERSION
  spec.authors       = ["Alfred Rowe"]
  spec.email         = ["alfred@encodevlabs.com"]
  spec.summary       = %q{Public Proxy IPs List}
  spec.description   = %q{Simple library to retrieve public IPs, PORT and other details such as speed, uptime, anonymity level, last check etc. Proxinova also comes with a commandline utility}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri", "~> 1.5.11"
end
