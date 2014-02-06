require 'vline'

class HomeController < ApplicationController
  before_filter :authenticate_user!

  def show
    @users = User.all
  end
end
