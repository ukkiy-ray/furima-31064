class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_period

  belongs_to :user, optional: true
  has_one :buyer
  has_one_attached :image

  #空の投稿を保存できないようにする
  validates :title, :item_details, :status_id, :category_id, :delivery_charge_id, :delivery_area_id, :delivery_period_id, :price, :image, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :status_id
    validates :delivery_charge_id
    validates :delivery_area_id
    validates :delivery_period_id
  end

  #価格設定を¥300~¥9,999,999に指定
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は¥300~¥9,999,999で設定してください' }
end
