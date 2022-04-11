FactoryBot.define do
  factory :subscription do
    title { Faker::App.name }
    price { Faker::Number.decimal(l_digits: 2).to_s }
    status { true }
    frequency { Faker::Number.digit}

    association :tea
    association :customer
  end
end
