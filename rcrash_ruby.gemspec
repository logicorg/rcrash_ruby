$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rcrash_ruby/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rcrash_ruby"
  s.version     = RcrashRuby::VERSION
  s.authors     = ["Alek Niemczyk"]
  s.email       = ["alek@rubylogic.pl"]
  s.homepage    = "https://github.com/rlogic/rcrash_ruby"
  s.summary     = "rCrash for Ruby"
  s.description = "rCrash local agent for Ruby projects."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.0.0"
end
