FactoryBot.define do
  factory :buying_address do
    postcode { '123-4567' }
    prefecture_id { rand(2..48) }
    municipality { '東京都' }
    street_address { '1-1' }
    building_name { '東京ハイツ' }
    phonenumber { '09012345678' }
    price { rand(300..100_000) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
