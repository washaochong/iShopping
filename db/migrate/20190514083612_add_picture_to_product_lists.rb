class AddPictureToProductLists < ActiveRecord::Migration[5.2]
  def change
    add_column :product_lists, :picture, :string
  end
end
