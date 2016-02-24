class AddAttachmentThumbToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :thumb
    end
  end

  def self.down
    remove_attachment :themes, :thumb
  end
end
