class CreateMenus < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.text :menu_name
      t.text :url
      t.date :date
      t.integer :check

      t.timestamps
    end
  end
end
