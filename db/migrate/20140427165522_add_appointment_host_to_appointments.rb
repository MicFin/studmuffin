class AddAppointmentHostToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :appointment_host_id, :integer
    add_index :appointments, :appointment_host_id
  end
end
