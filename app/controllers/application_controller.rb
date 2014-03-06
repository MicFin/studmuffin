class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:fullname, :email, :updated_at, :allergy, :avatar)
    end
  end

  def user_is_permitted
    unless (current_user.id == params[:user_id].to_i) || current_user.admin == true
      not_found
    end
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end
end
