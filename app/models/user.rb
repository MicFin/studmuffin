class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :admin, :phone_number 
  devise :database_authenticatable, :registerable, :timeoutable

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
