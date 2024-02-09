class CreateBuyings < ActiveRecord::Migration[7.0]
  def change
    create_table :buyings do |t|

      t.timestamps
    end
  end
end
