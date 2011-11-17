# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "evelpidon_test_helpers/version"

Gem::Specification.new do |s|
  s.name        = "evelpidon_test_helpers"
  s.version     = EvelpidonTestHelpers::VERSION
  s.authors     = ["Nikos Dimitrakopoulos", "Panayotis Matsinopoulos", "Eric Cohen"]
  s.email       = ["n.dimitrakopoulos@pamediakopes.gr", "p.matsinopoulos@fraudpointer.com", "e.koen@pamediakopes.gr"]
  s.homepage    = ""
  s.summary     = %q{Various test helpers for Rails projects}
  s.description = ""

  s.rubyforge_project = "evelpidon_test_helpers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rake"
  s.add_development_dependency "activemodel", ">=3.0"
  s.add_development_dependency "actionpack", ">=3.0"
  s.add_runtime_dependency "activesupport", ">=3.0"
  s.add_runtime_dependency "mocha"
end
