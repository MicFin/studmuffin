class User < ActiveRecord::Base
  attr_accessible :email, :password, :fullname, :allergy_ids, :password_confirmation, :first_name, :last_name
  devise :database_authenticatable, :registerable, :timeoutable
  has_many :users_allergies
  has_many :notes
  has_many :allergies, through: :users_allergies

  validates_presence_of :first_name, :last_name, :email, :password, {message: "can't be blank" }
end
