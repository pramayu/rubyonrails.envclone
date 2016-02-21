class AddCategoryIdToThemes < ActiveRecord::Migration
  def change
    add_reference :themes, :category, index: true, foreign_key: true
    add_reference :themes, :subcategory, index: true, foreign_key: true
  end
end
