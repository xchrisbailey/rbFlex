# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rbFlex/version'

Gem::Specification.new do |gem|
  gem.name          = "rbFlex"
  gem.version       = RbFlex::VERSION
  gem.authors       = ["chris bailey"]
  gem.email         = ["chris@subcu.lt"]
  gem.description   = %q{Parse flexget log file from remote computer}
  gem.summary       = %q{remote flexget.log parser}
  gem.homepage      = "http://sonkei.github.com/rbFlex"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  # gem dependencies
  gem.add_runtime_dependency 'net-ssh', '~> 2.7.0'
  gem.add_runtime_dependency 'actionpack', '4.0.0'
  gem.add_runtime_dependency 'activesupport', '4.0.0'
  gem.add_runtime_dependency 'slop', '~> 3.4.5'
end
