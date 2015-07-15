# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xcmultilingual/version'

Gem::Specification.new do |spec|
  spec.name          = "xcmultilingual"
  spec.version       = Xcmultilingual::VERSION
  spec.authors       = ["Naoki Morita"]
  spec.email         = ["namorit@gmail.com"]

  spec.summary       = "Command line tool for Swift localizations: It parses localization files in project and output swift file including functions with pretty good complementations"
  spec.description   = "Command line tool for Swift localizations: It parses localization files in the project and output swift file including functions with pretty good complementations!"
  spec.homepage      = "https://github.com/morizotter/xcmultilingual"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'thor'
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
