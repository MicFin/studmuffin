class User < ActiveRecord::Base
  attr_accessible :email, :password, :fullname, :allergy_ids, :password_confirmation
  devise :database_authenticatable, :registerable
  has_many :users_allergies
  has_many :notes
  has_many :allergies, through: :users_allergies
end
