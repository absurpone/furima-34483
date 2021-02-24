FactoryBot.define do
  factory :user do
    transient do
      gimei { Gimei.name } # gem 'gimei'を用いて漢字氏名とフリガナを生成する
    end

    nickname { Faker::Name.first_name }
    email { Faker::Internet.free_email }
    password = 'test1234'
    password { password }
    password_confirmation { password }
    family_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    kana_family_name { gimei.last.katakana }
    kana_first_name { gimei.first.katakana }
    birthday { Faker::Date.between(from: '1930-01-01', to: '2016-12-31') }
  end
end
