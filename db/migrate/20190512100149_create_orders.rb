class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    drop_table :orders
    create_table :orders do |t|
      t.integer :user_id
      t.decimal :total_money, precision: 10, scale: 2
      t.timestamps
    end
  end
end
