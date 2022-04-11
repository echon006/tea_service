FactoryBot.define do
  factory :tea do
    title { Faker::Beer.brand  }
    description { Faker::Beer.style }
    temp { Faker::Emotion.noun }
    brew_time { Faker::Number.between(from: 1, to: 10)}

  end
end
