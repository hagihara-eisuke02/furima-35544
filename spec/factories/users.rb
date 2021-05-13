FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.last_name }
    last_name { person.last.kanji }
    last_name_kana { person.last.katakana }
    first_name { person.first.kanji }
    first_name_kana { person.first.katakana }
    email { Faker::Internet.free_email }
    password              { 'ss11111' }
    password_confirmation { 'ss11111' }
    birthday { Faker::Date.birthday }
  end
end
