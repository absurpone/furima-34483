class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :pays_postage
  belongs_to :prefecture
  belongs_to :shipping_date
  
  belongs_to :user
  has_one_attached :image

  validates :price, presence: true # 価格のバリデーション、半角数字で入力の設定
  validates :title, presence: true
  validates :detail, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 }
  validates :condition_id, presence: true, numericality: { other_than: 1 }
  validates :pays_postage_id, presence: true, numericality: { other_than: 1 }
  validates :prefecture_id, presence: true, numericality: { other_than: 1 }
  validates :shipping_date_id, presence: true, numericality: { other_than: 1 }
  validates :image, presence: true
end
