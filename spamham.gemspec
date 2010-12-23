# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "spamham/version"

Gem::Specification.new do |s|
  s.name        = "SpamHam"
  s.version     = SpamHam::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Adam \"Arcath\" Laycock"]
  s.email       = ["adam@arcath.net"]
  s.homepage    = "http://www.arcath.net"
  s.summary     = %q{Provides Spam filtering for ruby and rails}
  s.description = %q{...}

  s.rubyforge_project = "spamham"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
