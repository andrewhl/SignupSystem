class CreateAfterSchoolProgramRegistrations < ActiveRecord::Migration
  def change
    create_table :after_school_program_registrations do |t|
      t.integer :child_id
      t.integer :after_school_program_id

      t.timestamps
    end
  end
end
