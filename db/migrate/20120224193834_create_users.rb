class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
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
      t.string :campus
      t.string :remember_token
      t.string :password_digest
      t.boolean :teacher, default: false
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
