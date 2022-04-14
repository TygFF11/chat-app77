require 'rails_helper'

RSpec.describe User, type: :model do
  before do 
    @user = FactoryBot.build(:user)
  end

  describe '新規登録' do
    context '新規登録できる' do
      it 'name,email,password,password_confirmationが存在する' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない' do
      it 'nameが空である' do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Name can't be blank")
      end
      it 'emailが空である' do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        anothor_user = FactoryBot.build(:user)
        anothor_user.email = @user.email
        anothor_user.valid?
        expect(anothor_user.errors.full_messages).to include("Email has already been taken") 
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = "user.email"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid") 
      end
      it 'passwordが空である' do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = "pass"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Internet.password(min_length:129)
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too long (maximum is 128 characters)")
      end
      it 'passwordとpassword_confirmationが一致しない' do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
