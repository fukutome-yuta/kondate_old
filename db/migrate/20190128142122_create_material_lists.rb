class CreateMaterialLists < ActiveRecord::Migration[5.2]
  def change
    create_table :material_lists do |t|
      t.references :menus, index: true, foreign_key: true
      #t.integer :menu_id
      t.text :material_name
      t.float :quantity
      t.text :unit

      t.timestamps
    end

    add_index :material_lists, :menu_id
    add_foreign_key :material_lists, :menus, column: :menu_id
    #add_index :material_lists, :unit_id
    #add_foreign_key :material_lists, :unit_lists, column: :unit_id
    #add_foreign_key :material_lists, :unit_lists
  end
end
