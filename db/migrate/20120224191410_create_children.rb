class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :first_name
      t.string :last_name
      t.string :health_card
      t.string :grade
      t.string :child_class
      t.string :campus
      t.string :shoe_size
      t.string :emergency_first_name
      t.string :emergency_last_name
      t.string :emergency_phone
      t.integer :user_id
      t.text :medical
      t.text :pickup_info

      t.timestamps
    end
    
  end
end
