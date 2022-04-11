class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.create!(subscription_params)
    subscription.update(status: true)
    render json: SubscriptionSerializer.new(subscription), status: 201
  end

  def update
    
  end

  private

  def subscription_params
    params.require(:subscription).permit(:title, :price, :frequency, :tea_id, :customer_id)
  end
end
