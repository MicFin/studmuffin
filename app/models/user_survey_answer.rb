class UserSurveyAnswer < ActiveRecord::Base
  belongs_to :user_survey
  belongs_to :question
  attr_accessible :choices, :user_input, :question_id, :user_survey_id
  # must make choice a hstop
  serialize :choices, ActiveRecord::Coders::Hstore.new({})
end
