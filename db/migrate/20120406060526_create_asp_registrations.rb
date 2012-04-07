class CreateAspRegistrations < ActiveRecord::Migration
  def change
    create_table :asp_registrations do |t|
      t.integer :child_id
      t.integer :after_school_program_id

      t.timestamps
    end
    
  end
end
