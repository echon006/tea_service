class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(new_subscription_params)
    subscription.update(status: true)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  private

  def new_subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :tea_id, :customer_id)
  end
end
