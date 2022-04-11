class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(subscription_params)
    subscription.update(status: true)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  def update
    sub = Subscription.find(params[:id])
    if sub.update_attributes(params.permit(:title, :price, :status,  :frequency, :tea_id, :customer_id))
      render json: SubscriptionSerializer.new(sub)
    else
      render json: {error: 'could not update subscription'}, status: 400
    end
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :tea_id, :customer_id)
  end
end
