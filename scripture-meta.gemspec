# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Gagan Awhad"]
  gem.email         = ["gagan.a.awhad@gmail.com"]
  gem.description   = %q{Ruby gem that provides logical operations on scripture meta-data}
  gem.summary       = %q{Ruby gem that provides logical operations on scripture meta-data}
  gem.homepage      = %q{https://www.github.com/gaganawhad/scripture-meta}

  gem.files         = `git ls-files`.split($\)
  gem.files = Dir["{app,config,db,lib}/**/*"] + ["README.md", "LICENSE"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "scripture-meta"
  gem.require_paths = ["lib"]
  gem.version       = '0.0.1'
  gem.add_development_dependency "rspec"
end

