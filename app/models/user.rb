class User < ActiveRecord::Base
  resourcify
  rolify

  before_save :uppercase_name

  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :sign_in_count, :encrypted_password, :created_at, :updated_at, :last_sign_in_at, :current_sign_in_at, :current_sign_in_ip, :last_sign_in_ip, :reset_password_token, :reset_password_sent_at, :remember_created_at, :rd, :age_months, :height_inches, :weight_ounces, :sex, :birth_date, :more_info, :temp_flag

  devise :database_authenticatable, :registerable, :timeoutable, :trackable, :recoverable, :rememberable, :validatable, :timeoutable

  has_many :user_surveys
  has_many :surveys, through: :user_surveys
  has_many :user_dietary_restrictions
  has_many :dietary_restrictions, through: :user_dietary_restrictions, :uniq => true
  has_many :user_families
  has_many :families, through: :user_families
  has_many :users
  has_many :appointments
  has_many :family_leader_ship_roles, :class_name => "Family", :foreign_key => "head_of_family_id"
  
  has_many :patient_focus, :class_name => "Appointment", :foreign_key => "patient_focus_id"
  has_many :appointment_hosts, :class_name => "Appointment", :foreign_key => "appointment_host_id"

  validates_presence_of :first_name, {message: "can't be blank" }

  # saves phone number in normalized US format
  phony_normalize :phone_number, :default_country_code => 'US'

  # validates phone number is in a correct format
  validates :phone_number, :phony_plausible => true

  # def is_rd?
  #   if self.rd == true
  #     return true
  #   else
  #     return false
  #   end
  # end

  def password_required?
    # if user roll x then
    # !persisted? || !password.nil? || !password_confirmation.nil?
    # else
    false
    # end
  end

  def email_required?
    # ## if user roll x then 
    # true
    ## else
    false
    # end
  end

  def uppercase_name
    self.first_name.capitalize!
    self.last_name.capitalize!
  end

end
