require 'test_helper'

module Workarea
  module Zendesk
    class GatewayTest < Workarea::TestCase
      include ZendeskApiConfig

      def test_create_request
        Workarea.with_config do |config|
          config.zendesk.rest_endpoint = "https://d3v-5752.zendesk.com"
          VCR.use_cassette("zendesk/create_request") do
            request = {
              request: {
                requester: {
                  name: "Bob Clams",
                  email: "bclams@workarea.com"
                },
                subject: "TEST IGNORE ME",
                comment: {
                  body: "I've crashed my car on the internet super highway"
                }
              }
            }

            response = gateway.create_request(request)

            assert response.success?
          end
        end
      end

      def test_create_request_error
        Workarea.with_config do |config|
          config.zendesk.rest_endpoint = "https://d3v-5752.zendesk.com"
          VCR.use_cassette("zendesk/create_request_error") do
            request = {
              request: {
                requester: {
                  name: "Bob Clams",
                  email: "bclams"
                },
                subject: "TEST IGNORE ME",
                comment: {
                  body: "I've crashed my car on the internet super highway"
                }
              }
            }

            response = gateway.create_request(request)

            refute response.success?
            assert(response.error_details.include?("Email:  bclams is not properly formatted"))
          end
        end
      end

      private

      def gateway
        Workarea::Zendesk.gateway
      end
    end
  end
end
