class BuyingAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :buying_id, :postcode, :prefecture_id, :municipality, :street_address, :building_name, :phonenumber

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :municipality
    validates :street_address
    validates :phonenumber
  end
  validates :prefecture_id, numericality: {other_than: 0, message: "can't be blank"}

  def save
    buying = Buying.create(user_id: user_id, item_id: item_id)
    Address.create(buying_id: buying.id, postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, street_address: street_address, building_name: building_name, phonenumber: phonenumber)
  end
end