class User < ActiveRecord::Base
  attr_accessible :email, :password, :fullname, :allergy_ids
  devise :database_authenticatable
  has_many :users_allergies
  has_many :notes
  has_many :allergies, through: :users_allergies
end
