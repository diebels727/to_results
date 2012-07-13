# -*- encoding: utf-8 -*-
require File.expand_path('../lib/to_object/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["diebels727"]
  gem.email         = ["diebelsalternative@hotmail.com"]
  gem.description   = %q{converts keys of a hash, and nested hashes, in to objects}
  gem.summary       = %q{converts keys of a hash, and nested hashes, in to objects}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "to_object"
  gem.require_paths = ["lib"]
  gem.version       = ToObject::VERSION
end
