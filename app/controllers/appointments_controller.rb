class AppointmentsController < ApplicationController
  def index
    if current_user
      @user = current_user
      @my_appointments = Appointment.where(appointment_host_id: @user.id)
      @my_upcoming_appointments = @my_appointments.where("date > ?", DateTime.now).order('date ASC, created_at ASC')
      @my_previous_appointments = @my_appointments.where("date < ?", DateTime.now).order('date ASC, created_at ASC')
    elsif current_dietitian
      @user = current_dietitian 
      @my_appointments = Appointment.where(dietitian_id: @user.id)
      @my_upcoming_appointments = @my_appointments.where("date > ?", DateTime.now).order('date ASC, created_at ASC')
      @my_previous_appointments = @my_appointments.where("date < ?", DateTime.now).order('date ASC, created_at ASC')
    elsif current_admin_user
      @user = current_admin_user
      @appointments = Appointment.all
      @appointments_no_dietitian = Appointment.where(dietitian_id: nil)
      @upcoming_appointments = Appointment.where("date > ?", DateTime.now).order('date ASC, created_at ASC')
      @previous_appointments = Appointment.where("date < ?", DateTime.now).order('date ASC, created_at ASC')
    end
    binding.pry
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
    # send to first survey after appointment made???
    redirect_to new_user_survey_path(survey_id: 1)
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