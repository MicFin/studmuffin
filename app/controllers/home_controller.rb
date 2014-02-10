require 'vline'

class HomeController < ApplicationController
  before_filter :authenticate_user!

  def show
    @users = User.all
    @user = current_user
    @notes = @user.notes.all
    @note = @user.notes.new
    @user_allergies = UsersAllergy.where(user_id: @user.id)
  end
end
