class WerbhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    payload = request.body.read
     sig_header = request.env['HTTP_STRIPE_SIGNATURE']
     event = nil
     endpoint_secret = Rails.application.credentials[:stripe][:webhook]

     begin
       event = Stripe::Webhook.construct_event(
         payload, sig_header, endpoint_secret
       )
     rescue JSON::ParserError => e
       # Invalid payload
       status 400
       return
     rescue Stripe::SignatureVerificationError => e
       # Invalid signature
       status 400
       return
     end

     # Handle the event
     case event.type
     when 'payment_intent.succeeded'
       payment_intent = event.data.object # contains a Stripe::PaymentIntent

           puts "PaymentIntent succeeded"
           @submission = Book.find_by!(stripe_payment_id: payment_intent.id)
           @submission.update(status: 'paid')
           puts "Submission found: #{@submission.title}"

           # SubmissionMailer.receipt(@submission).deliver_later
           # SubmissionMailer.newsubmission(@submission).deliver_later
     else
       puts "Unhandled event type: #{event.type}"
     end
     render json: {message: 'success'}
  end
end
