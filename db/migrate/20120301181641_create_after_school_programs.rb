class CreateAfterSchoolPrograms < ActiveRecord::Migration
  def change
    create_table :after_school_programs do |t|
      t.string :day
      t.string :program_name
      t.string :price
      t.string :status
      t.string :dates
      t.string :payable_to
      t.string :campus
      t.text :notes
      t.integer :max_registrants
      t.integer :min_registrants

      t.timestamps
    end
  end
end
