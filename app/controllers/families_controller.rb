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
    @user = current_user
    @family = Family.new(name: "#{@user.last_name} Family")
    @family.users.build
    @new_user = User.new
    respond_to do |format|
      format.js
      format.html
    end
  end

  def edit
    @family = Family.find(params[:id])
  end

  def create
    @user = current_user
    @family = Family.new(params[:family])
    @family.users << @user
    @family.head_of_family = @user
    @family.save
    render :index 
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