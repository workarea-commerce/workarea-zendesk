module Workarea
  module ZendeskApiConfig
    extend ActiveSupport::Concern
    included do
      setup do
        @_old_creds = Rails.application.secrets.zendesk

        Rails.application.secrets.zendesk = {
          api_user_name: "email@example.com",
          api_token: "yourtoken"
        }
      end

      teardown do
        Rails.application.secrets.zendesk = @_old_creds
      end
    end
  end
end
