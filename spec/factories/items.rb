FactoryBot.define do
  factory :item do
    association :user
    trade_name          { '商品名' }
    explanation         { '説明文' }
    category_id         { rand(2..11) }
    condition_id        { rand(2..7) }
    delivery_charge_id  { rand(2..3) }
    prefecture_id       { rand(2..48) }
    delivery_time_id    { rand(2..4) }
    price               { rand(300..9_999_999) }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
