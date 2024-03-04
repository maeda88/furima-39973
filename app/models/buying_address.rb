class BuyingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postcode, :prefecture_id, :municipality, :street_address, :building_name,
                :phonenumber, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality
    validates :street_address
    validates :phonenumber, format: { with: /\A\d{10,11}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :token
  end

  def save
    buying = Buying.create(user_id:, item_id:)
    Address.create(buying_id: buying.id, postcode:, prefecture_id:, municipality:,
                   street_address:, building_name:, phonenumber:)
  end
end
