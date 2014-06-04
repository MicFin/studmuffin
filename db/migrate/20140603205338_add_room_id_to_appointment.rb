class AddRoomIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :room_id, :integer
  end
end
