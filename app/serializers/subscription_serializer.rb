class SubscriptionSerializer
  include JSONAPI::Serializer

  attributes :title, :price, :frequency, :status, :tea_id, :customer_id

end
