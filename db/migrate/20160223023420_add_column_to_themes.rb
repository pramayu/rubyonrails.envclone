class AddColumnToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :column, :string
  end
end
