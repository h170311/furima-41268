FactoryBot.define do
  factory :item do
    item_name { 'いす' }
    item_description { '柔らかくて大きい' }
    category_id { 2 }
    item_status_id { 2 }
    shipping_cost_id          { 2 }
    prefecture_id             { 1 }
    delivery_time_id          { 2 }
    price { 2000 }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
