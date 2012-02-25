class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.string :health_card
      t.text :medical
      t.string :grade
      t.string :class
      t.string :campus
      t.integer :parent_id
      t.string :emergency_first_name
      t.string :emergency_last_name
      t.string :emergency_phone

      t.timestamps
    end
  end
end
