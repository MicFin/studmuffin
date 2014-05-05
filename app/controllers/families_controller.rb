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
<<<<<<< HEAD
    @user = current_user
    @family = Family.new(name: "#{@user.last_name} Family")
    @new_user = User.new
=======
    # famliies form is sending itself back to the new method when it should go to the create method, could not find bug so added if statement to redirect
    if params["_method"]
      create
    else
      @user = current_user
      @family = Family.new(name: "#{@user.last_name} Family")
      @family.users.build
      @new_user = User.new
      respond_to do |format|
        format.js
        format.html
      end
    end
>>>>>>> cocoon
  end

  def edit
    @family = Family.find(params[:id])
  end

  def create
    @user = current_user
    @user.update_attributes(params[:family][:users_attributes]["0"])
    params[:family][:users_attributes].delete("0")
    @family = Family.new(params[:family])
    @family.users << @user
    @family.head_of_family = @user
    @family.save
<<<<<<< HEAD
    redirect_to root_path
=======
    redirect_to new_user_dietary_restriction_path
>>>>>>> cocoon
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