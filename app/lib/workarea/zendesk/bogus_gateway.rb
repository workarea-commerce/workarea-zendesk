module Workarea
  module Zendesk
    class BogusGateway
      attr_reader :options, :credentials, :rest_endpoint

      def initialize(options = {})
        @options = options
        @credentials = Workarea::Zendesk.credentials
        @rest_endpoint = Workarea::Zendesk.rest_endpoint
      end

      def create_request(request = {})
        res_json = [ 200, { 'Content-Type': 'text/plain', }, success_response_body ]

        conn = Faraday.new do |builder|
          builder.adapter :test do |stub|
            stub.post('api/v2/request.json') { |env| res_json }
          end
        end
        resp = conn.post('api/v2/request.json')

        Response.new(resp)
      end

      def method_missing(method, *args)
        generic_response
      end

      private

      def generic_response
        response = Faraday.new do |builder|
          builder.adapter :test do |stub|
            stub.post('api/v2/generic.json') { |env| [ 200, {}, nil ] }
          end
        end

        response.post('api/v2/generic.json')
      end

      def success_response_body
        {
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
        }.to_json
      end
    end
  end
end
