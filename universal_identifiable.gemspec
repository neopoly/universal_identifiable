# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'universal_identifiable/version'

Gem::Specification.new do |spec|
  spec.name          = "universal_identifiable"
  spec.version       = UniversalIdentifiable::VERSION
  spec.authors       = ["Andreas Busold"]
  spec.email         = ["an.bu@gmx.net"]
  spec.description   = %q{Make your model uniq and identifiable through a readable name.}
  spec.summary       = %q{Adds uuids to ActiveRecord models along with validators.}
  spec.homepage      = "https://github.com/Kobra-Khan/universal_identifiable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest-spec-rails"
  spec.add_development_dependency "sqlite3", "~> 1.3"
  spec.add_development_dependency 'railties'
  spec.add_runtime_dependency 'activerecord', '>= 3'
end
