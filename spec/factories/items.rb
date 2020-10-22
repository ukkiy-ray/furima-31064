FactoryBot.define do
  factory :item do
    association :user

    title {Faker::Lorem.word}
    item_details {Faker::Lorem.sentence}
    status_id {'2'}
    category_id {'2'}
    delivery_charge_id {'2'}
    delivery_area_id {'2'}
    delivery_period_id {'2'}
    price {'1000000'}
    
    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
