class UserDietaryRestriction < ActiveRecord::Base
  belongs_to :user
  belongs_to :dietary_restriction
  attr_accessible :other_field, :user_id, :dietary_restriction_id
end
