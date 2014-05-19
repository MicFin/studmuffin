class AddDateToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :date, :datetime
    add_index :appointments, :date
  end
end
