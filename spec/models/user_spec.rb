require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nickname, last_name, first_name, last_name_furigana, first_name_furigana, email, password, password_confirmation, birthdayが存在していれば登録できる" do
      end

      it "last_nameとfirst_nameが全角平仮名、片仮名、漢字で入力されていれば登録できる" do
      end

      it "last_name_furiganaとfirst_name_furiganaが全角カタカナで入力されていれば登録できる" do
      end

      it "passwordが6文字以上であれば登録できる" do
      end

    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
      end

      it "emailが空だと登録できない" do
      end

      it "emailが重複していると登録できない" do
      end

      it "passwordが空だと登録できない" do
      end

      it "passwordが5文字以下だと登録できない" do
      end

      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
      end

      it "last_nameが空だと登録できない" do
      end

      it "last_nameが半角入力の場合登録できない" do
      end

      it "first_nameが空だと登録できない" do
      end

      it "last_nameが半角入力の場合登録できない" do
      end

      it "last_name_furiganaが空だと登録できない" do
      end

      it "last_name_furiganaが全角カタカナではない場合登録できない" do
      end

      it "first_name_furiganaが空だと登録できない" do
      end

      it "first_name_furiganaが全角カタカナではない場合登録できない" do
      end

      it "birthdayが空だと登録できない" do
      end

    end
  end
end
