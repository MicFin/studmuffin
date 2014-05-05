class UserDietaryRestriction < ActiveRecord::Base
  belongs_to :user
  belongs_to :dietary_restriction
  attr_accessible :other_field, :user_id, :dietary_restriction_id
  validates_uniqueness_of :user_id, :scope => :dietary_restriction_id
end
