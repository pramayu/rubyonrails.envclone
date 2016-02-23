class AddLayerToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :layered, :string
    add_column :themes, :adobe, :string
    add_column :themes, :pixel, :string
    add_column :themes, :print, :string
  end
end
