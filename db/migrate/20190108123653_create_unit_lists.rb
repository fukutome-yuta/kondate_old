class CreateUnitLists < ActiveRecord::Migration[5.2]
  def change
    create_table :unit_lists do |t|
      t.text :unit_name

      t.timestamps
    end
  end
end
