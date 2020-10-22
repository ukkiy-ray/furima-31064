require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できるとき' do
      it "title, item_details, status_id, category_id, delivery_charge_id, delivery_area_id, delivery_period_id, price, imageが存在していれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it "titleが空だと登録できない" do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it "item_detailsが空だと登録できない" do
        @item.item_details = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Item details can't be blank")
      end

      it "status_idが空だと登録できない" do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end

      it "status_idが1の場合登録できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end

      it "category_idが空だと登録できない" do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it "category_id" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end

      it "delivery_charge_idが空だと登録できない" do
        @item.delivery_charge_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
      end

      it "delivery_charge_idが1の場合登録できない" do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery charge must be other than 1")
      end

      it "delivery_area_idが空だと登録できない" do
        @item.delivery_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area can't be blank")
      end

      it "delivery_area_idが1の場合登録できない" do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery area must be other than 1")
      end

      it "delivery_period_idが空だと登録できない" do
        @item.delivery_period_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery period can't be blank")
      end

      it "delivery_period_idが1の場合登録できない" do
        @item.delivery_period_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery period must be other than 1")
      end

      it "priceが空だと登録できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it "priceが300円より安いと登録できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999で設定してください")
      end

      it "priceが9,999,999円より高いと登録できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price は¥300~¥9,999,999で設定してください")
      end

      it "imageが空だと登録できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

    end
  end
end
