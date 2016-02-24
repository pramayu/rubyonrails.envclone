class AddAttachmentPreviewToAssets < ActiveRecord::Migration
  def self.up
    change_table :assets do |t|
      t.attachment :preview
    end
  end

  def self.down
    remove_attachment :assets, :preview
  end
end
