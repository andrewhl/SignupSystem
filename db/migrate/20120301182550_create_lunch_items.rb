class CreateLunchItems < ActiveRecord::Migration
  def change
    create_table :lunch_items do |t|
      t.string :item_name
      t.string :option_name
      t.string :dates
      t.string :campus
      t.string :vendor
      t.string :day
      t.string :price
      t.string :status

      t.timestamps
    end
  end
end
