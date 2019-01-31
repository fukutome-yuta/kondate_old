class CreateMaterialList < ActiveRecord::Migration[5.2]
  def change
    create_table :material_lists do |t|
      t.integer :menu_id
      t.text :material_name
      t.float :quantity
      t.text :unit

      t.timestamps
    end

    add_index :material_lists, :menu_id
    add_foreign_key :material_lists, :menus
  end
end
