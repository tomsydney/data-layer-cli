$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "eagle_cli/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name          = "eagle_cli"
  gem.version       = EagleCli::VERSION
  gem.authors       = ["Peter Tellgren"]
  gem.email         = ["peter.tellgren@eaglegenomics.com"]
  gem.homepage      = "https://www.eaglegenomics.com"
  gem.summary       = "Providing a CLI to the Eaglegenomics different APIs"
  gem.description   = ""
  gem.files         = Dir["{lib}/**/*"] + Dir["{lib}/**/**/*"]  + ["Rakefile", "README.md"]
  gem.executables   = ['eagle_cli']
  gem.require_paths = ['lib']
  gem.test_files    = Dir["spec/**/*"]
  # cli tooling
  gem.add_dependency 'commander'
  # immutable config
  gem.add_dependency 'values'
  # for http
  gem.add_dependency 'rest-client'
end
