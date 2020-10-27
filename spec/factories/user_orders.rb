FactoryBot.define do
  factory :user_order do
    user_id {2}
    item_id {2}
    postal_code { '123-4567' }
    prefecture { 1 }
    city { '東京都' }
    address {'1-1'}
    building_name { '東京ハイツ' }
    phone_number {'09012345678'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
