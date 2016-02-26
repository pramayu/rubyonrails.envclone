class AddUserIdToThemes < ActiveRecord::Migration
  def change
    add_reference :themes, :user, index: true, foreign_key: true
  end
end
