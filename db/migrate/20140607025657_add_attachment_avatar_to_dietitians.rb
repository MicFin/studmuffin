class AddAttachmentAvatarToDietitians < ActiveRecord::Migration
  def self.up
    change_table :dietitians do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :dietitians, :avatar
  end
end
