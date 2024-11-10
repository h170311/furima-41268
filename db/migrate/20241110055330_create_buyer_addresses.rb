class CreateBuyerAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :buyer_addresses do |t|
      t.string     :postcode,        null: false
      t.integer    :prefecture_id,   null: false
      t.string     :municipalities,  null: false
      t.string     :street_address,  null: false
      t.string     :building_name     
      t.string     :telephone,       null: false
      t.references :buy,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
