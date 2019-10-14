module Workarea
  module Zendesk
    class Response
      attr_reader :response

      def initialize(response = {})
        @response = response
      end

      def success?
        @response.status.to_s =~ /^2/
      end

      def body
        return {} unless @response.body.present?
        JSON.parse(@response.body)
      end

      def error_details
        return unless body.present?
        return unless body["error"].present?

        body["details"].to_s
      end
    end
  end
end
