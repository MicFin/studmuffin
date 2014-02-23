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
end
