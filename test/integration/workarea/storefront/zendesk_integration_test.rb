require 'test_helper'

module Workarea
  module Storefront
    class ZendeskIntegrationTest < Workarea::IntegrationTest
      include Workarea::Storefront::IntegrationTest

      def test_js_widgent_presence
        Workarea.with_config do |config|
          key = "PUBLIC_KEY"
          config.zendesk.public_key = key

          get storefront.root_path
          assert_includes(response.body, 'https://static.zdassets.com/ekr/snippet.js?key=PUBLIC_KEY')

          config.zendesk.public_key = nil

          get storefront.root_path
          refute_includes(response.body, 'https://static.zdassets.com/ekr/snippet.js?key=')
        end
      end
    end
  end
end
