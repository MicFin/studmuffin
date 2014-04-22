class UserDietaryRestriction < ActiveRecord::Base
  belongs_to :user
  belongs_to :dietary_restriction
  attr_accessible :other_field
end
