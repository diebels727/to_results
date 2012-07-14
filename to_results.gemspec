# -*- encoding: utf-8 -*-
require File.expand_path('../lib/to_results/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["diebels727"]
  gem.email         = ["diebelsalternative@hotmail.com"]
  gem.description   = %q{Turn JSON in to instantiated results.  Get results in JSON.  Parse those results.  Turn those results in to objects.}
  gem.summary       = %q{Primarily for those programmatic APIs that return JSON.  You work with JSON, you want an easy way to turn parsed-JSON into instantiated ruby object. }
  gem.homepage      = "http://github.com/diebels727/to_results"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "to_results"
  gem.require_paths = ["lib"]
  gem.version       = ToResults::VERSION
end
