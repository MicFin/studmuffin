class User < ActiveRecord::Base
  rolify
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :sign_in_count, :encrypted_password, :created_at, :updated_at, :last_sign_in_at, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :reset_password_token, :reset_password_sent_at, :remember_created_at, :rd

  devise :database_authenticatable, :registerable, :timeoutable, :trackable, :recoverable, :rememberable, :validatable, :timeoutable

  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  has_many :user_answers
  
  validates_presence_of :first_name, :last_name, {message: "can't be blank" }

  # saves phone number in normalized US format
  phony_normalize :phone_number, :default_country_code => 'US'

  # validates phone number is in a correct format
  validates :phone_number, :phony_plausible => true

  def is_rd?
    if self.rd == true
      return true
    else
      return false
    end
  end

  def password_required?
    # if user roll x then
    !persisted? || !password.nil? || !password_confirmation.nil?
    # else
    # false
    # end
  end

  def email_required?
    ## if user roll x then 
    true
    ## else
    # true
    # end
  end

end
