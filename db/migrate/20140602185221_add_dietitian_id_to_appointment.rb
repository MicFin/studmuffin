class AddDietitianIdToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :dietitian_id, :integer
  end
end
