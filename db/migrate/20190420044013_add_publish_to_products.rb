class AddPublishToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :publish, :boolean, default: true
  end
end
