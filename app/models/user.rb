class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :admin, :phone_number, :sign_in_count, :admin, :encrypted_password, :created_at, :updated_at, :last_sign_in_at, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :reset_password_token, :reset_password_sent_at, :remember_created_at

  devise :database_authenticatable, :registerable, :timeoutable, :trackable, :recoverable, :rememberable, :validatable, :timeoutable

  validates_presence_of :first_name, :last_name, {message: "can't be blank" }
  # validates :phone_number, format: { with: 1?\s*\W?\s*([2-9][0-8][0-9])\s*\W?\s*([2-9][0-9]{2})\s*\W?\s*([0-9]{4})(\se?x?t?(\d*))?;, message: "bad format" }
  phony_normalize :phone_number, :default_country_code => 'US'
  # validates :email, :uniqueness => true
  validates_presence_of :phone_number, {message: "is an invalid number.  Please provide your RDN with a phonenumber to call in case of a connection issue.  We will ONLY call you during a consultation.  And we will NEVER share your number." }
  validates :phone_number, :phony_plausible => true

  def is_admin?
    if self.admin == true
      return true
    else
      return false
    end
  end

end
