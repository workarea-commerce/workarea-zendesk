require 'workarea/testing/teaspoon'

Teaspoon.configure do |config|
  config.root = Workarea::Zendesk::Engine.root
  Workarea::Teaspoon.apply(config)
end
