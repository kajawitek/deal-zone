FactoryBot.define do
  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.paragraph(sentence_count: 2) }
    price { Faker::Commerce.price }
    quantity { Faker::Number.number(digits: 2) }
  end
end
