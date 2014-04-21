class UserSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  attr_accessible :completed, :completed_at
end
