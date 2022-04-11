class Api::V1::CustomerSubscriptionsController < ApplicationController
  def index
    render json: SubscriptionSerializer.new(Customer.find(params[:customer_id]).subscriptions)
  end
end
