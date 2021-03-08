class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :pays_postage
  belongs_to :prefecture
  belongs_to :shipping_date

  belongs_to :user
  has_one :purchase
  has_many :comments
  has_one_attached :image

  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  validates :image, :title, :detail, presence: true
  validates :category_id, :condition_id, :pays_postage_id, :prefecture_id, :shipping_date_id, presence: true,
                                                                                              numericality: { other_than: 1 }
  def self.search(search)
    if search != ''
      Item.where('title LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end
end
