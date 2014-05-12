class FamiliesController < ApplicationController
  def index
    @families = Family.all
  end

  def show
    @user = current_user
    @family = Family.find(params[:id])
    @family_dietary_restrictions = @family.dietary_restrictions
    @family_members = @family.users 
  end

  def new
    # famliies form is sending itself back to the new method when it should go to the create method, could not find bug so added if statement to redirect
    if params["_method"]
      create
    else
      @user = current_user
      @family = Family.new(name: @user.last_name)
      @family.users.build
      @new_user = User.new(last_name: @user.last_name)
      respond_to do |format|
        format.js
        format.html
      end
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def create
    @user = current_user
      # if no user is selected for appointment then default to main user
      if params["patient_focus"] == nil
        params["patient_focus"] = "0"
      end
    # changes height and weight to proper input 
      params[:family][:users_attributes].each do |user, attributes|
        if attributes["first_name"] != ""
          if (attributes["height"]["feet"].to_i >= 1)
            attributes["height"]["feet"] = attributes["height"]["feet"].to_i * 12
            attributes["height_inches"] = attributes["height"]["feet"].to_i + attributes["height"]["inches"].to_i
          elsif attributes["height"]["inches"].to_i
            attributes["height_inches"] = attributes["height"]["inches"].to_i
          end
          if (attributes["weight"]["pounds"].to_i >= 1)
            attributes["weight"]["pounds"] = attributes["weight"]["pounds"].to_i * 16
            attributes["weight_ounces"] = attributes["weight"]["pounds"].to_i + attributes["weight"]["ounces"].to_i
          elsif attributes["weight"]["ounces"].to_i
            attributes["weight_ounces"] = attributes["weight"]["ounces"].to_i
          end
        end
        # removes height and weight fields from model
        attributes.delete("height")
        attributes.delete("weight")
        # marks user with temp flag for initial appt focus
        if user == params["patient_focus"]
          attributes["temp_flag"] = true
        end
      end
      # updates user 
    @user.update_attributes(params[:family][:users_attributes]["0"])
    # removes user from params
    params[:family][:users_attributes].delete("0")
    # creates family - nested users created as well
    @family = Family.new(params[:family])
    # add current user to family
    @family.users << @user
    # make current user head of familay
    @family.head_of_family = @user
    # save family
    @family.save
    # create appointment with user as host and patient focus from building family 
    @appointment = Appointment.new(patient_focus_id: @family.users.find_by_temp_flag(true).id, appointment_host_id: @user.id)
    # save appointment.
    @appointment.save
    redirect_to new_user_dietary_restriction_path
  end

  def update
    @family = Family.find(params[:id])
    @family.update_attributes(params[:family])
    @family.save
    redirect_to root_path(anchor: 'profile')
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    redirect_to families_path
  end
end