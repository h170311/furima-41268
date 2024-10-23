FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) + '1a' }
    password_confirmation { password }
    last_name_kanji       { '田' }
    first_name_kanji      { '田' }
    last_name_kana        { 'タ' }
    first_name_kana       { 'タ' }
    birthday              { '1999-01-01' }
  end
end
