$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "edlcli/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |gem|
  gem.name          = "edlcli"
  gem.version       = EdlCli::VERSION
  gem.authors       = ["Peter Tellgren"]
  gem.email         = ["peter.tellgren@eaglegenomics.com"]
  gem.homepage      = "http://eaglegenomics.com"
  gem.summary       = "Providing a CLI to the Eaglegenomics data layer"
  gem.description   = ""
  gem.files         = Dir["{lib}/**/*"] + Dir["{lib}/**/**/*"]  + ["Rakefile", "README.md"]
  gem.executables   = ['edlcli']
  gem.require_paths = ['lib']
  gem.test_files    = Dir["spec/**/*"]
  # cli tooling
  gem.add_dependency 'commander'
  # immutable config
  gem.add_dependency 'values'
end
