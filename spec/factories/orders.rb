FactoryBot.define do
  factory :order do
    postcode { '456-1234' }
    prefecture_id { 1 }
    municipalities { '名古屋市' }
    street_address { '青山1-1-1' }
    building_name { 'いいビル777' }
    telephone { 1_234_567_890 }
    # item_id { 5 }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
