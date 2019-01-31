class CreateShoppingLists < ActiveRecord::Migration[5.2]
  def change
    create_table :shopping_lists do |t|
      t.text :s_name
      t.float :s_quantity
      t.text :s_unit

      t.timestamps
    end
  end
end
