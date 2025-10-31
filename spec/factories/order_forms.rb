FactoryBot.define do
  factory :order_form do
    postal_code { '123-4567' }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street_address { Faker::Address.street_address }
    building_name { Faker::Address.secondary_address }
    phone_number { Faker::Number.number(digits: 11).to_s }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
