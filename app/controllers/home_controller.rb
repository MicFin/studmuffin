require 'vline'

class HomeController < ApplicationController
  before_filter :authenticate_user!

  def show
    @users = User.all
    @user = current_user
    @notes = @user.notes.all
    @note = @user.notes.new
  end
end
