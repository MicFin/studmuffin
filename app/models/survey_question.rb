class SurveyQuestion < ActiveRecord::Base
  belongs_to :survey
  belongs_to :question
  has_many :user_answers
  has_many :answers, through: :user_answers
  attr_accessible :order
end
