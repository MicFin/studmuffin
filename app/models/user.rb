class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name
  devise :database_authenticatable, :registerable, :timeoutable

  validates_presence_of :first_name, :last_name, :email, :password, {message: "can't be blank" }
  validates :email, :uniqueness => true


  def is_admin?
    if self.admin == true
      return true
    else
      return false
    end
  end

end
