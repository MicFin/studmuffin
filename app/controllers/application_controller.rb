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
    # add to sign in count every time user signs in
    if resource.class == User
      # resource.sign_in_count = resource.sign_in_count + 1
      # if resource.is_rd? 
      #   # send admin user to show page
      #   :show_page
      # else
      #   if resource.sign_in_count <= 1
      #     # if first time then send to survey
      #     :survey_page
      #   else
          # if not first time then send to waiting room
          :show_page
        end
      end 
    end
  end 

end
