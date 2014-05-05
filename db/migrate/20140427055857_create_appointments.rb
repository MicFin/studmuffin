class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.belongs_to :user
      t.belongs_to :patient_focus, :class_name => "User", :foreign_key => "user_id"
      t.timestamps
    end
    add_index :appointments, :user_id
  end
end
