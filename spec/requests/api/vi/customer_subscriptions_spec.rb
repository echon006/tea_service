require 'rails_helper'

RSpec.describe "Customer's subscriptions endpoint" do
  describe "happy path" do
    it "returns all subscriptions a single customer has" do
      customer_1 = create(:customer)
      customer_2 = create(:customer)
      tea_1 = create(:tea)
      tea_2 = create(:tea)
      tea_3 = create(:tea)

      sub = create :subscription, { tea_id: tea_1.id, customer_id: customer_1.id}
      sub = create :subscription, { tea_id: tea_2.id, customer_id: customer_1.id}
      sub = create :subscription, { tea_id: tea_3.id, customer_id: customer_1.id}
      sub = create :subscription, { tea_id: tea_3.id, customer_id: customer_2.id}

      get api_v1_customer_subscriptions_path(customer_1)
      expect(response.status).to eq(200)

      subs = JSON.parse(response.body, symbolize_names: true)

      expect(subs).to have_key(:data)
      expect(subs[:data].count).to eq(3)
    end
  end
end
