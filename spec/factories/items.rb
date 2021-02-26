FactoryBot.define do
  factory :item do
    title            { "商品名テスト" }
    detail           { "商品説明テスト" }
    category_id      { 2 }
    condition_id     { 2 }
    pays_postage_id  { 2 }
    prefecture_id    { 2 }
    shipping_date_id { 2 }
    price            { 1000 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image_png')
    end
  end
end
