class CreateKondateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :kondate_lists do |t|
      t.date :kondate_date
      t.text :kondate_name
      t.text :kondate_url
      t.integer :kondate_id

      t.timestamps
    end
  end
end
