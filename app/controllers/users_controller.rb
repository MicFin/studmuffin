class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @user_allergies = UsersAllergy.where(user_id: params[:id])
  end

  def new
    binding.pry
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    binding.pry
    @user = User.new(params[:user])
    @user.save
    redirect_to root_path
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
    redirect_to root_path(anchor: 'profile')
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end
