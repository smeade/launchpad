class AddCategoryToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :category, index: true
  end
end
