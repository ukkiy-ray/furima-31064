class Address < ApplicationRecord
  belongs_to :buyer, optional: true
end
