$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "workarea/zendesk/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "workarea-zendesk"
  spec.version     = Workarea::Zendesk::VERSION
  spec.authors     = ["Jeff Yucis"]
  spec.email       = ["jyucis@workarea.com"]
  spec.homepage    = "https://github.com/workarea-commerce/workarea-zendesk"
  spec.summary     = "Zendesk Integration for Workarea Commerce"
  spec.description = "Zendesk Help Desk integration for workarea commerce"
  spec.license     = "Business Software License"

  spec.files = `git ls-files`.split("\n")

  spec.add_dependency 'workarea', '~> 3.x'
end
