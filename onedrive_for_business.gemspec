# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onedrive_for_business/version'

Gem::Specification.new do |spec|
  spec.name          = "onedrive_for_business"
  spec.version       = OneDriveForBusiness::VERSION
  spec.authors       = ["Adam Michael"]
  spec.email         = ["adam@ajmichael.net"]

  spec.license       = 'MIT'

  spec.summary       = %q{Access your OneDrive for Business storage.}
  spec.homepage      = "https://github.com/aj-michael/onedrive_for_business"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
