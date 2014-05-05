class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def show
    @user = current_user
    @appointment = Appointment.find(params[:id])
  end

  def new
    @user = current_user
    @family_members = @user.families.last.users
    @appointment = Appointment.new
  end

  def edit
    @appointment = Appointment.find(params[:id])
  end

  def create
    @user = current_user
    @appointment = Appointment.new(params[:appointment])
    if params["meeting"]
      @appointment.patient_focus_id = params["meeting"]["patient_focus"].to_i
    end
    @appointment.appointment_host_id = @user.id
    ## does not assign user and focus, only assigns focus as user
    @appointment.save
    redirect_to new_user_survey_path(survey_id: 2)
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update_attributes(params[:appointment])
    @appointment.save
    redirect_to root_path(anchor: 'profile')
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end
end