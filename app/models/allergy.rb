class Allergy < ActiveRecord::Base
  attr_accessible :name
  has_many :users_allergies
  has_many :users, through: :users_allergies
end
