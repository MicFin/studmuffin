class AppointmentsController < ApplicationController
before_filter :config_opentok,:except => [:index, :show, :new, :edit, :create, :destroy]

  def index
    if current_user
      @user = current_user
      @my_appointments = Appointment.where(appointment_host_id: @user.id)
      @my_upcoming_appointments = @my_appointments.where("date > ?", DateTime.now).order('date ASC, created_at ASC')
      @my_previous_appointments = @my_appointments.where("date < ?", DateTime.now).order('date ASC, created_at ASC')
      ## relies on user only filling out 1 survey...multiple appointment surveys will not work
      @appt_survey_question = Survey.where(id: 1).first.questions[2].content 
      @appt_survey_response = @user.user_surveys.where(survey_id: 1).last.user_survey_answers[2].user_input
    elsif current_dietitian
      @user = current_dietitian 
      @my_appointments = Appointment.where(dietitian_id: @user.id)
      @my_upcoming_appointments = @my_appointments.where("date > ?", DateTime.now).order('date ASC, created_at ASC')
      @my_previous_appointments = @my_appointments.where("date < ?", DateTime.now).order('date ASC, created_at ASC')
      @appt_survey_question = Survey.where(id: 1).first.questions[2].content
    elsif current_admin_user
      @user = current_admin_user
      @appointments = Appointment.all
      @appointments_no_dietitian = Appointment.where(dietitian_id: nil)
      @upcoming_appointments = Appointment.where("date > ?", DateTime.now).order('date ASC, created_at ASC')
      @previous_appointments = Appointment.where("date < ?", DateTime.now).order('date ASC, created_at ASC')
    end
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
    @dietitians = Dietitian.all
    @users = User.all
    if @appointment.dietitian_id
      @dietitian_id = @appointment.dietitian.id
    else
      @dietitian_id = nil
    end
    if @appointment.date
      @appointment_date = @appointment.date.in_time_zone("Eastern Time (US & Canada)").strftime("%B %d, %Y %I:%M %p")
    else
      @appointment_date = nil
    end
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
    ## clean datetime input
    if params[:appointment][:date] 
      ## add EST to datetime 
      params[:appointment][:date] = params[:appointment][:date] + " EDT"
      ## switch month/day to day/month to match format for saving
      params[:appointment][:date] = params[:appointment][:date].gsub(%r{(.*)/(.*)/(.*)}, '\2/\1/\3')
    end
    ## update 
    @appointment.update_attributes(params[:appointment])
    ## if no room created for dietitian
    if Room.where(dietitian_id: @appointment.dietitian_id).count == 0
      @new_session = @opentok.create_session 

      @new_room = Room.new(dietitian_id:  @appointment.dietitian_id, public: true, sessionId: @new_session.session_id, name: "One on One Room")
      @tok_token = @new_session.generate_token :session_id =>@new_session.session_id  
      @new_room.save!
    end
    # set appointment to room (1st and only for now)
    if @appointment.room_id == nil
      @appointment.room_id = Room.where(dietitian_id: @appointment.dietitian_id).first.id
    end
    # save appointment
    @appointment.save
    redirect_to appointments_path
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def config_opentok
    if @opentok.nil?
     @opentok = OpenTok::OpenTok.new ENV["API_KEY"], ENV["API_SECRET"]
    end
  end

end