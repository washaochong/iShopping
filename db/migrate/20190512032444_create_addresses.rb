class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :shipping_name
      t.string :shipping_address
      t.integer :phone
      t.timestamps
    end
  end
end
