# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nasdaq_query/version'

Gem::Specification.new do |gem|
  gem.name          = "nasdaq_query"
  gem.version       = NasdaqQuery::VERSION
  gem.authors       = ["Jim Lindstrom"]
  gem.email         = ["jim.lindstrom@gmail.com"]
  gem.description   = %q{Get stock information from Nasdaq.com}
  gem.summary       = %q{Stock info from nasdaq.com}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_dependency 'nokogiri'
end
