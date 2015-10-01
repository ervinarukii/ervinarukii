class PaymentsController < ApplicationController
  before_action :authenticate_user!, except: :webhooks
  skip_before_action :verify_authenticity_token, only: :webhooks

  def payment
    @page = "Payment"
    @page_icon = "credit-card"
    gon.client_token = generate_client_token
  end

  def checkout
    result = current_user.payment(params)
    if result.success?
      redirect_to payment_path, notice: "Transaction successfull" 
    else
      flash[:alert] = "Something is went wrong, #{result.errors.first.message}"
      gon.client_token = generate_client_token

      render :payment
    end
  end

  def webhooks
    if request.get?
      challenge = params["bt_challenge"]
      challenge_response = Braintree::WebhookNotification.verify(challenge)
      render plain: challenge_response, status: 200
    else
      webhook_notification = Braintree::WebhookNotification.parse(
        params["bt_signature"],
        params["bt_payload"]
      )
      # puts "[Webhook Received #{webhook_notification.timestamp}] Kind: #{webhook_notification.kind} | Subscription: #{webhook_notification.subscription.id}"
      render plain: challenge_response, status: 200
    end
  end

  private

    def generate_client_token
      if current_user.has_payment_info?
        Braintree::ClientToken.generate(customer_id: current_user.braintree_customer_id)
      else
        Braintree::ClientToken.generate
      end
    end

end
