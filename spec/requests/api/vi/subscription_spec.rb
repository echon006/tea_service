require 'rails_helper'

RSpec.describe 'Subscription API' do
  describe 'create: post /subscription' do
    describe 'happy path' do
      it 'returns the new subscription as a json object' do
        customer = create(:customer)
        tea = create(:tea)
        subscription_params = ({
                    title: 'Title 1 for sub 1',
                    price: '4.99',
                    frequency: 4,
                    tea_id: tea.id,
                    customer_id: customer.id
                    })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_subscriptions_path, headers: headers, params: JSON.generate(subscription: subscription_params)
        created_sub = Subscription.last

        expect(response.status).to eq(201)
        expect(created_sub.title).to eq(subscription_params[:title])
        expect(created_sub.price).to eq(subscription_params[:price])
      end
    end
    describe 'sad path' do
      it 'returns a 404 error if subscription cannot be created due to invalid params ' do
        customer = create(:customer)
        tea = create(:tea)
        subscription_params = ({
                    title: 'Title 1 for sub 1',
                    frequency: 4,
                    tea_id: tea.id,
                    customer_id: customer.id
                    })
        headers = {"CONTENT_TYPE" => "application/json"}
        post api_v1_subscriptions_path, headers: headers, params: JSON.generate(subscription: subscription_params)

        expect(response.status).to eq(400)
      end
    end
  end

  describe 'update: patch /subscription' do
    describe 'happy path' do
      it 'can update a subscription' do
        customer = create(:customer)
        tea = create(:tea)
        sub = create :subscription, { tea_id: tea.id, customer_id: customer.id}
        put api_v1_subscription_path(sub), params: { status: false }
        expect(response).to be_successful
        expect(Subscription.last.status).to eq(false)
      end
    end

    describe 'sad path' do
      it 'cannot update a subscription' do
        customer = create(:customer)
        tea = create(:tea)
        sub = create :subscription, { tea_id: tea.id, customer_id: customer.id}
        put api_v1_subscription_path(sub), params: { title: '' }

        expect(response.status).to eq(400)
      end
    end
  end
end
