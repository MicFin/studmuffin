class AddClientNoteToAppointment < ActiveRecord::Migration
  def change
    add_column :appointments, :client_note, :text
  end
end
