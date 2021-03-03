class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :zip_code, :prefecture_id, :city, :street, :building, :telephone, :purchase_id, :item_id, :user_id

  with_options presence: true do
    validates :zip_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city
    validates :street
    validates :telephone, format: { with: /\A0[0-9]{1,10}\z/ }
    validates :user_id
    validates :item_id
  end

  def save
    # 購入情報を保存し、変数purchaseに代入
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    # 住所を保存する
    Address.create(zip_code: zip_code, prefecture_id: prefecture_id, city: city, street: street, building: building, telephone: telephone, purchase_id: purchase.id)
  end
end