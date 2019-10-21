module Workarea
  module Zendesk
    class Gateway
      attr_reader :options

      def initialize(options = {})
        @options = options
      end

      def create_request(request)
        resp = connection.post('api/v2/requests.json') do |req|
          req.body = request.to_json
        end

        Response.new(resp)
      end

      private

      def encoded_basic_auth
        "Basic #{Base64.encode64(auth_string)}"
      end

      def connection
        headers = { 'Content-Type' => 'application/json', 'Authorization' => encoded_basic_auth }

        request_timeouts = {
          timeout: Workarea.config.zendesk[:api_timeout],
          open_timeout: Workarea.config.zendesk[:open_timeout]
        }

        conn = Faraday.new(url: rest_endpoint, headers: headers, request: request_timeouts)
        conn
      end

      def api_user_name
        options[:api_user_name]
      end

      def api_token
        options[:api_token]
      end

      def auth_string
        "#{api_user_name}/token:#{api_token}"
      end

      def rest_endpoint
        options[:rest_endpoint]
      end
    end
  end
end
