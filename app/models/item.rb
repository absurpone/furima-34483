class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :price, presence: true # 価格のバリデーション、半角数字で入力の設定
  validates :title, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :pays_postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :image, presence: true
end
