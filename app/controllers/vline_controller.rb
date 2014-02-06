require 'digest/md5'
require 'vline'

class VlineController < ApplicationController
  before_filter :authenticate_user!

  def initialize(currentUserId = nil)
    if currentUserId
      @current_user ||= find_user(currentUserId)
    end
  end

  def authorize
    if params[:client_id] != Vline.client_id
      redirect_to Vline.auth_error_redirect_url(Vline::AuthError::ACCESS_DENIED, params[:state])
      return
    end

    if params[:response_type] != 'code'
      redirect_to Vline.auth_error_redirect_url(Vline::AuthError::INVALID_REQUEST, params[:state])
      return
    end

    code = Vline.create_request_token(current_user.id)
    url = Vline.auth_url + '?code=' + code
    if params[:state]
      url += '&state=' + params[:state]
    end
    redirect_to url
  end

  def get_profile(userId)
    user = find_user(userId)
    profile_for(user)
  end

  def get_contact_profiles(userId)
    users = find_contact_users(userId)
    users.map { |u| profile_for(u) }
  end

  private

  def find_user(userId)
    User.find(userId)
  end

  def find_contact_users(userId)
    User.all
  end

  def profile_for(user)
    profile = { 'id' => user.id, 'displayName' => user.email }
    thumbnail_url = thumbnail_url_for(user)
    if thumbnail_url
      profile['thumbnail_url'] = thumbnail_url_for(user)
    end
    profile
  end

  def thumbnail_url_for(user)
    if user.respond_to?('thumbnail_url')
      user.thumbnail_url
    elsif user.respond_to?('email')
      gravatar_url_for(user.email)
    end
  end

  def gravatar_url_for(email)
    # see http://en.gravatar.com/site/implement/images/
    hash = Digest::MD5.hexdigest(email.downcase)
    "https://www.gravatar.com/avatar/#{hash}?d=mm"
  end
end
