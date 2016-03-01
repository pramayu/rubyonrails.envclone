class AddAttachmentHomepageToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :homepage
    end
  end

  def self.down
    remove_attachment :users, :homepage
  end
end
