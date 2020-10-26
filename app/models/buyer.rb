class Buyer < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :user, optional: true
  has_one :address
end
