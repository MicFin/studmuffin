class DietaryRestriction < ActiveRecord::Base
  attr_accessible :name, :type
  has_many :user_dietary_restrictions
  has_many :users, through: :user_dietary_restrictions
  
end
