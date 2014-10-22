class AddNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :full_name, :string
    add_column :users, :nick_name, :string
  end
end
