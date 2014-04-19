class UserAnswer < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey_question
  attr_accessible :user_input
end
