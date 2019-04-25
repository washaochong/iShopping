class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    drop_table :cart_items
    create_table :cart_items do |t|
      t.integer :cart_id
      t.integer :product_id
      t.integer :quantity
      t.timestamps
    end
  end
end
