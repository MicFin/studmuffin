class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from ActionController::RoutingError, :with => :page_not_found
  rescue_from StandardError, :with => :server_error

  def user_is_permitted
    unless (current_user.id == params[:user_id].to_i) || current_user.admin == true
      not_found
    end
  end

  def not_found
    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  def after_sign_in_path_for(resource)
    # add to sign in count every time user signs in
    if resource.class == User
      # resource.sign_in_count = resource.sign_in_count + 1
      # if resource.is_rd? 
      #   # send admin user to show page
      #   :show_page
      # else
        if resource.sign_in_count <= 1
          # if first time then send to build family
          new_family_path
        else
          # if not first time then send to waiting room
          :show_page
        end
      # end 
    end
  end 

  protected

  def page_not_found
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 404 }
      format.all  { render nothing: true, status: 404 }
    end
  end

  def server_error
    respond_to do |format|
      format.html { render template: 'errors/not_found_error', layout: 'layouts/application', status: 500 }
      format.all  { render nothing: true, status: 500}
    end
  end

end
