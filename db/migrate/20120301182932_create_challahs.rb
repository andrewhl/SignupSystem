class CreateChallahs < ActiveRecord::Migration
  def change
    create_table :challahs do |t|
      t.string :campus
      t.string :type
      t.string :price
      t.string :status

      t.timestamps
    end
  end
end
