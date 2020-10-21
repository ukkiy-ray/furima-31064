FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'abcd1234'}
    password_confirmation {password}
    last_name           {'山田'}
    first_name          {'太郎'}
    last_name_furigana  {'ヤマダ'}
    first_name_furigana {'タロウ'}
    birthday            {Faker::Date.between(from: '1930-1-1', to: '2015-12-31')}
  end
end
