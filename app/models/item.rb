class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_period

  belongs_to :user
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :title, :item_details, :status_id, :category_id, :delivery_charge_id, :delivery_area_id, :delivery_period_id, :price, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :delivery_area_id, numericality: { other_than: 1 }
  validates :delivery_period_id, numericality: { other_than: 1 }

  #価格設定を¥300~¥9,999,999に指定
  validates :price, numericality: { greater_than_or_equal_to: 300 }
  validates :price, numericality: { less_than_or_equal_to: 9999999 }
end
