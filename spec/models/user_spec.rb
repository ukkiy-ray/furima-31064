require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいく時' do
      it "nickname, last_name, first_name, last_name_furigana, first_name_furigana, email, password, password_confirmation, birthdayが存在していれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "emailに@がないと登録できない" do
        @user.email = 'yamada.gmail.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "passwordが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下だと登録できない" do
        @user.password = 'a0a0a'
        @user.password_confirmation = 'a0a0a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordが英語のみだと登録できない" do
        @user.password = 'abcdef'
        @user.password_confirmation = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "passwordが数字のみだと登録できない" do
        @user.password = '123456'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "last_nameが空だと登録できない" do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end

      it "last_nameが半角入力の場合登録できない" do
        @user.last_name = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字で入力してください")
      end

      it "first_nameが空だと登録できない" do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end

      it "last_nameが半角入力の場合登録できない" do
        @user.first_name = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字で入力してください")
      end

      it "last_name_furiganaが空だと登録できない" do
        @user.last_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end

      it "last_name_furiganaが半角入力の場合登録できない" do
        @user.last_name_furigana = 'yamada'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana 全角カタカナで入力してください")
      end

      it "last_name_furiganaがひらがな入力の場合登録できない" do
        @user.last_name_furigana = 'やまだ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana 全角カタカナで入力してください")
      end

      it "last_name_furiganaが漢字入力の場合登録できない" do
        @user.last_name_furigana = '山田'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana 全角カタカナで入力してください")
      end

      it "first_name_furiganaが空だと登録できない" do
        @user.first_name_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end

      it "first_name_furiganaが半角入力の場合登録できない" do
        @user.first_name_furigana = 'tarou'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana 全角カタカナで入力してください")
      end

      it "first_name_furiganaがひらがな入力の場合登録できない" do
        @user.first_name_furigana = 'たろう'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana 全角カタカナで入力してください")
      end

      it "first_name_furiganaが漢字入力の場合登録できない" do
        @user.first_name_furigana = '太郎'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana 全角カタカナで入力してください")
      end

      it "birthdayが空だと登録できない" do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
