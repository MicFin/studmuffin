class AddAppointmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apptdate, :datetime
    add_column :users, :apptquestions, :text
    add_column :users, :apptfoodhist, :text
  end
end
