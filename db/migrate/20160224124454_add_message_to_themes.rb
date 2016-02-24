class AddMessageToThemes < ActiveRecord::Migration
  def change
    add_column :themes, :message, :text
  end
end
