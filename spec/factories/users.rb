FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name           { '佐藤' }
    first_name            { '次郎' }
    family_name_kana      { 'サトウ' }
    first_name_kana       { 'ジロウ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
