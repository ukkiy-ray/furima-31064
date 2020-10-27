require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    it '全ての値が正しければ保存できる' do
      expect(@user_order).to be_valid
    end

    it 'postal_codeが空だと保存できないこと' do
      @user_order.postal_code = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @user_order.postal_code = '1111111'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @user_order.prefecture = 0
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存できないこと' do
      @user_order.city = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空だと登録できないこと' do
      @user_order.address = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Address can't be blank")
    end

    it 'phone_numberが空だと登録できないこと' do
      @user_order.phone_number = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberが10桁以下だと保存できないこと' do
      @user_order.phone_number = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number はハイフン無し10桁もしくは11桁の半角数字で入力してください")
    end

    it 'phone_numberが11桁以上だと保存できないこと' do
      @user_order.phone_number = '111111111111'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number はハイフン無し10桁もしくは11桁の半角数字で入力してください")
    end

    it 'phone numberにハイフンが含まれていると保存できないこと' do
      @user_order.phone_number = '090-1111-1111'
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Phone number はハイフン無し10桁もしくは11桁の半角数字で入力してください")
    end
    
    it  'tokenが空だと保存できないこと' do
      @user_order.token = nil
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Token can't be blank")
    end

  end
end
