class ApplicationController < ActionController::Base
  protect_from_forgery

  def user_is_permitted
    unless (current_user.id == params[:user_id].to_i) || current_user.admin == true
      not_found
    end
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def after_sign_in_path_for(resource)

    # if resource.is_admin? == true
    #   #add where an admin should go on sign up
    # else
      :show_page
    # end 
  end 
end
