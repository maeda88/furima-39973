class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :buying, null: false, foreign_key: true
      t.string :postcode, null: false
      t.integer :prefecture_id, null: false
      t.string :municipality, null: false
      t.string :street_address, null: false
      t.string :building_name
      t.string :phonenumber, null: false
      t.timestamps
    end
  end
end
