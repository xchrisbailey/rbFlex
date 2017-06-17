# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbFlex/version'

Gem::Specification.new do |gem|
  gem.name          = "rbFlex"
  gem.version       = RbFlex::VERSION
  gem.authors       = ["chris bailey"]
  gem.email         = ["chris@ghostly.io"]
  gem.description   = %q{Parse flexget log file from remote computer}
  gem.summary       = %q{remote flexget.log parser}
  gem.homepage      = "http://sonkei.github.com/rbFlex"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # gem dependencies
  gem.add_runtime_dependency 'net-ssh', '~> 4.1.0', '>= 4.1.0'
  gem.add_runtime_dependency 'actionpack', '~> 5.1.1', '>= 5.1.1'
  gem.add_runtime_dependency 'activesupport', '~> 5.1.1', '>= 5.1.1'
  gem.add_runtime_dependency 'slop', '~> 3.6.0', '>= 3.6.0'
  gem.add_runtime_dependency 'bigdecimal', '~> 1.3.2', '>= 1.3.2'
end
