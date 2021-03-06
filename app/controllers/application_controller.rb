class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # rescue_from ActionController::RoutingError, :with => :page_not_found
  # rescue_from StandardError, :with => :server_error

  # def user_is_permitted
  #   unless (current_user.id == params[:user_id].to_i) || current_user.admin == true
  #     not_found
  #   end
  # end

  # def not_found
  #   render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  # end

  def after_sign_in_path_for(resource)

    ##### should just go to user_authenticated_root ####
    ##### but is not so needed to direct to :appointments ####
    # if person signing in is a user
    if resource.class == User
        if resource.sign_in_count <= 1
          # if first time then send to build family
          new_family_path
        else
          # if not first time then send to waiting room
          user_authenticated_root_path
        end
    # if person signing in is a dietitian
    elsif resource.class == Dietitian
      # send to appointments index
      appointments_path

    # if person signing in is an Admin
    elsif resource.class == AdminUser
      # send to admin dashboard
      admin_root_path
    end
  end 



  protected

  # def page_not_found
  #   respond_to do |format|
  #     format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
  #     format.all  { render nothing: true, status: 404 }
  #   end
  # end

  # def server_error
  #   respond_to do |format|
  #     format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 500 }
  #     format.all  { render nothing: true, status: 500}
  #   end
  # end

end
