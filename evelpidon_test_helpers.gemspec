# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "evelpidon_test_helpers/version"

Gem::Specification.new do |s|
  s.name        = "evelpidon_test_helpers"
  s.version     = EvelpidonTestHelpers::VERSION
  s.authors     = ["Nikos Dimitrakopoulos"]
  s.email       = ["n.dimitrakopoulos@pamediakopes.gr"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "evelpidon_test_helpers"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
