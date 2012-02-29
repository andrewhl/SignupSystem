class ChangeBooleanFieldsInUsers < ActiveRecord::Migration
  def change
    remove_column :users, :admin_boolean
    remove_column :users, :teacher_boolean
    add_column :users, :admin, :boolean, default: false
    add_column :users, :teacher, :boolean, default: false
  end
end
