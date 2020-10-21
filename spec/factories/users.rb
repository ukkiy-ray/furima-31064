FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length:6)
    password {password}
    password_confirmation {password}
    last_name           {Faker::Name.last_name}
    first_name          {Faker::Name.first_name}
    last_name_furigana  {Faker::Name.last_name}
    first_name_furigana {Faker::Name.first_name}
    birthday            {Faker::Date.between(from: '1930-1-1', to: '2015-12-31')}
  end
end
