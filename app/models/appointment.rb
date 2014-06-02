class Appointment < ActiveRecord::Base
  attr_accessible :patient_focus_id, :appointment_host_id, :dietitian_id
  belongs_to :appointment_host, :class_name => "User", :foreign_key => "appointment_host_id"
  belongs_to :patient_focus, :class_name => "User", :foreign_key => "patient_focus_id"
  belongs_to :dietitian
end
