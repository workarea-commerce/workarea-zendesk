Workarea.configure do |config|
  config.zendesk = ActiveSupport::Configurable::Configuration.new
  config.zendesk.public_key = ""

  config.zendesk.rest_endpoint = ""
  config.zendesk.api_timeout = 2
  config.zendesk.open_timeout = 2
end
