class UserSurveyAnswer < ActiveRecord::Base
  belongs_to :user_survey
  belongs_to :question
  attr_accessible :choice, :user_input
end
