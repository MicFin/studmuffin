require 'vline'

class HomeController < ApplicationController
  before_filter :authenticate_user!

  def show
    @users = User.all
    @user = current_user
  end

  def survey
  end
end
