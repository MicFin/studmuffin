class UsersAllergy < ActiveRecord::Base
  has_one :user
  has_one :allergy
  belongs_to  :user
  belongs_to  :allergy
end
