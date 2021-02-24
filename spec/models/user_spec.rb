require 'rails_helper'

  RSpec.describe User, type: :model do
    before do
      @user = FactoryBot.build(:user)
    end
    
    describe 'ユーザー新規登録' do
      context '新規登録できる時' do
        it 'nickname, email, password, password_confirmation, family_name, first_name, kana_family_name, kana_first_name, birthdayが存在すれば登録できること' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上かつ、英字と数字を1字以上含んでいれば登録できること' do
          @user.password = 'abc123'
          @user.password_confirmation = @user.password
          expect(@user).to be_valid
        end

      end
      context '新規登録できない時' do
        it 'nicknameが空では登録できないこと' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できないこと' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空では登録できないこと' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'family_nameが空では登録できないこと' do
          @user.family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name can't be blank")
        end

        it 'first_nameが空では登録できないこと' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'kana_family_nameが空では登録できないこと' do
          @user.kana_family_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana family name can't be blank")
        end

        it 'kana_first_nameが空では登録できないこと' do
          @user.kana_first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana first name can't be blank")
        end

        it 'birthdayが空では登録できないこと' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it 'passwordが5文字以下では登録できないこと' do
          @user.password = 'abc12'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end

        it 'passwordが英字のみでは登録できないこと' do
          @user.password = 'abcdef'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordとpassword_confirmationが不一致では登録できないこと' do
          @user.password = 'abc123'
          @user.password_confirmation = 'abcd1234'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordが数字のみでは登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = @user.password
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it '重複したemailが既に存在する場合は登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end

        it 'emailが@を含まない場合は登録できないこと' do
          @user.email = "testgmail.com"
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it 'family_nameが半角文字では登録できないこと' do
          @user.family_name = "tanaka"
          @user.valid?
          expect(@user.errors.full_messages).to include("Family name is invalid")
        end

        it 'first_nameが半角文字では登録できないこと' do
          @user.first_name = "taro"
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'kana_family_nameが全角カナでない場合は登録できないこと' do
          @user.kana_family_name = "たなか"
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana family name is invalid")
        end

        it 'kana_first_nameが全角カナでない場合は登録できないこと' do
          @user.kana_first_name = "たろう"
          @user.valid?
          expect(@user.errors.full_messages).to include("Kana first name is invalid")
        end


      end



    end
  end
