class UserSurvey < ActiveRecord::Base
  belongs_to :survey
  belongs_to :user
end
