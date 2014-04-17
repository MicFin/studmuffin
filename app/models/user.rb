class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :admin, :phone_number, :sign_in_count, :admin, :encrypted_password, :created_at, :updated_at, :last_sign_in_at, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_ip 

  devise :database_authenticatable, :registerable, :timeoutable, :trackable

  validates_presence_of :first_name, :last_name, :email, :password, {message: "can't be blank" }
  validates :email, :uniqueness => true
  validates_presence_of :phone_number, {message: "can't be blank.  Your phone number will ONLY be used in case of a connection problem.  Otherwise we will NEVER call you.  And we will NEVER share your number." }

  def is_admin?
    if self.admin == true
      return true
    else
      return false
    end
  end

end
