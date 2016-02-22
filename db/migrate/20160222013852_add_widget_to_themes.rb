class AddWidgetToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :widget, :string
  end
end
