class AddAttachmentClipToThemes < ActiveRecord::Migration
  def self.up
    change_table :themes do |t|
      t.attachment :clip
    end
  end

  def self.down
    remove_attachment :themes, :clip
  end
end
