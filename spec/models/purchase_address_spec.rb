require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_address = FactoryBot.build(:purchase_address, user_id: user.id, item_id: item.id)
      sleep 0.1 # エラー回避のため処理の待機の設定
    end

    context '商品購入ができる時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@purchase_address).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @purchase_address.building =''
        expect(@purchase_address).to be_valid
      end
    end

    context '商品購入ができない時' do
      it "tokenが空では登録できないこと" do
        @purchase_address.token = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Token can't be blank")
      end

      it 'zip_codeが空だと保存できないこと' do
        @purchase_address.zip_code =''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeが半角ハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_address.zip_code ='1234567'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Zip code is invalid")
      end

      it 'prefecture_idが1(---)では保存できないこと' do
        @purchase_address.prefecture_id = 1
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include('Prefecture must be other than 1')
      end

      it 'cityが空では保存できないこと' do
        @purchase_address.city =''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("City can't be blank")
      end

      it 'streetが空では保存できないこと' do
        @purchase_address.street =''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Street can't be blank")
      end
      
      it 'telephoneが空では保存できないこと' do
        @purchase_address.telephone =''
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone can't be blank")
      end

      it 'telephoneは英数混合では登録できないこと' do
        @purchase_address.telephone ='090abcdefgh'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end      

      it 'telephoneは11桁以内の半角数字でないと保存できないこと' do
        @purchase_address.telephone ='090123456789'
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Telephone is invalid")
      end

      it 'user_idが空では購入できないこと' do
        @purchase_address.user_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが空では購入できないこと' do
        @purchase_address.item_id = nil
        @purchase_address.valid?
        expect(@purchase_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
