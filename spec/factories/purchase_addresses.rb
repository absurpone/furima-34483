FactoryBot.define do
  factory :purchase_address do
    token         { "tok_abcdefghijk00000000000000000" }
    zip_code      { '123-4567' }
    prefecture_id { 2 }
    city          { "東西市" }
    street        { "南北区1-2-3" }
    building      { '中央ビル1001' }
    telephone     { '09011119999' }
  end
end
