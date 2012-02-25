class AddShoeSizeToChildren < ActiveRecord::Migration
  def change
    add_column :children, :shoe_size, :string

  end
end
