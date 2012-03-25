class CreateVolunteerPrograms < ActiveRecord::Migration
  def change
    create_table :volunteer_programs do |t|
      t.string :program_name
      t.string :dates
      t.string :status
      t.integer :max_registrants

      t.timestamps
    end
  end
end
