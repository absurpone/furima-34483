require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品を登録できる時' do
    it '商品登録に必要な情報が全て存在すれば登録できること' do
      expect(@item).to be_valid
    end
  end

  describe '商品を登録できない時' do
    it 'imageが空では登録できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'titleが空では登録できないこと' do
      @item.title = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Title can't be blank")
    end

    it 'detailが空では登録できないこと' do
      @item.detail = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Detail can't be blank")
    end

    it 'category_idが1(---)では登録できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'condition_idが1(---)では登録できないこと' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it 'pays_postage_idが1(---)では登録できないこと' do
      @item.pays_postage_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Pays postage must be other than 1")
    end

    it 'prefecture_idが1(---)では登録できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'shipping_date_idが1(---)では登録できないこと' do
      @item.shipping_date_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping date must be other than 1")
    end

    it 'priceが空では登録できないこと' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceに全角数字は登録できないこと' do
      @item.price = '５００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceに英字は登録できないこと' do
      @item.price = 'One thousand'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceに小数点以下の数値がある時は登録できないこと' do
      @item.price = 1000.5
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be an integer")
    end

    it 'priceに300未満の数値は登録できないこと' do
      @item.price = 200
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceに9,999,999より大きい数値は登録できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
    
end
