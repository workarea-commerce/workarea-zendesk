require 'workarea'
require 'workarea/storefront'
require 'workarea/admin'

require 'workarea/zendesk/engine'
require 'workarea/zendesk/version'

module Workarea
  module Zendesk
    def self.config
      Workarea.config.zendesk
    end

    def self.credentials
      (Rails.application.secrets.zendesk || '')
    end

    def self.rest_endpoint
      config.rest_endpoint
    end

    def self.api_user_name
      credentials[:api_user_name]
    end

    def self.api_token
      credentials[:api_token]
    end

    def self.gateway
      if credentials.present?
        Zendesk::Gateway.new(rest_endpoint: rest_endpoint, api_user_name: api_user_name, api_token: api_token)
      else
        Zendesk::BogusGateway.new
      end
    end
  end
end
