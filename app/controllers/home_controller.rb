require 'vline'

class HomeController < ApplicationController
  before_filter :check_dietitian_logged_in!
  # before_filter :check_user_logged_in!

  def show
    @users = User.all
    if current_user
      @user = current_user
    else
      @user = current_dietitian
    end
  end

  private

    def check_dietitian_logged_in! 
    # dietitian must be logged in
      if current_user 
        # if it is a user then validated
        true
      else
        authenticate_dietitian!
      end
    end

    # def check_user_logged_in! 
    #### as of now users are not authenticated because they are not using devise confirmable module
    # # if dietitian is not logged in, user must be logged in
    #   if !dietitian_signed_in?
    #     authenticate_user!
    #   end   
    # end

end
