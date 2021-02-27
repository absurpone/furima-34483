FactoryBot.define do
  factory :user do
    nickname              { 'テスト用ユーザー' }
    email                 { Faker::Internet.free_email }
    password =            'test1234'
    password              { password }
    password_confirmation { password }
    family_name           { '田中' }
    first_name            { '一郎' }
    kana_family_name      { 'タナカ' }
    kana_first_name       { 'イチロウ' }
    birthday              { '1988-01-01' }
  end
end
