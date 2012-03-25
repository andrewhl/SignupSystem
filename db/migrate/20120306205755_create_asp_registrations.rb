class CreateAspRegistrations < ActiveRecord::Migration
  def change
    create_table :asp_registrations do |t|
      t.integer :child_id
      
      
      
      t.timestamps
    end
  end
end
