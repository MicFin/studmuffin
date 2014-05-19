class RemoveUserIdFromAppointment < ActiveRecord::Migration
  def up
    remove_column :appointments, :user_id
  end

  def down
    add_column :appointments, :user_id, :integer
  end
end
