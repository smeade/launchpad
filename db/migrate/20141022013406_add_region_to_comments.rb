class AddRegionToComments < ActiveRecord::Migration
  def change
    add_column :comments, :region_name, :string
  end
end
