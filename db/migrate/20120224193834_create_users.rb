class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :mother_first_name
      t.string :mother_last_name
      t.string :mother_email
      t.string :mother_work_phone
      t.string :mother_home_phone
      t.string :father_first_name
      t.string :father_last_name
      t.string :father_email
      t.string :father_work_phone
      t.string :father_home_phone
      t.string :address
      t.string :city
      t.string :postal_code
      t.string :username
      t.string :remember_token
      t.boolean :teacher_boolean
      t.boolean :admin_boolean

      t.timestamps
    end
  end
end
