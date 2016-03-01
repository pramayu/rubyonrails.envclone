class ChangeTypeDataToUser < ActiveRecord::Migration
  def change
  	change_column :users, :profile_text,  :text
  end
end
