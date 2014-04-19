class SurveyQuestions < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question
  attr_accessible :order
end
