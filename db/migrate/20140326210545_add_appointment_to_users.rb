class AddAppointmentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :apptdate, :datetime, default: '1901-01-01 01:00:00'
    add_column :users, :apptquestions, :text, default: 'NA'
    add_column :users, :apptfoodhist, :text, default: 'NA'
  end
end
