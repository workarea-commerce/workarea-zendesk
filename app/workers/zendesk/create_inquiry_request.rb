module Workarea
  module Zendesk
    class CreateInquiryRequest
      class ZendeskTicketError < StandardError; end

      include Sidekiq::Worker
      include Sidekiq::CallbacksWorker

      sidekiq_options(
        enqueue_on: { Workarea::Inquiry => [:create] }
      )

      def perform(id)
        inquiry = Workarea::Inquiry.find(id)
        response = Workarea::Zendesk.gateway.create_request(zendesk_request(inquiry))

        raise ZendeskTicketError, response.error_details  unless response.success?
      end

      private

      def test_prefix
        !Rails.env.production? ? "** IGNORE * TEST * IGNORE ** " : ""
      end

      def zendesk_request(inquiry)
        {
          request: {
            requester: {
              name: inquiry.name,
              email: inquiry.email
            },
            subject: test_prefix + inquiry.full_subject,
            comment: {
              body: comment_body(inquiry)
            }
          }
        }
      end

      def comment_body(inquiry)
        "Name: #{inquiry.name}\nEmail: #{inquiry.email}\nSubject: #{inquiry.full_subject}\nOrder Id: #{inquiry.order_id || ""}\nMessage: #{inquiry.message}"
      end
    end
  end
end
