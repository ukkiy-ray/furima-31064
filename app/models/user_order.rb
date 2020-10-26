class UserOrder
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture, :city, :address, :building_name, :phone_number, :token

  with_options presence: true do
     validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
     validates :prefecture
     validates :city
     validates :address
     validates :phone_number, format: {with: /\A\d{10,11}\z/, message: "は11桁以内の半角数字で入力してください"}
     validates :token
  end

  validates :prefecture, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)

    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, address: address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end