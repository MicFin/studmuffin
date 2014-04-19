class Questions < ActiveRecord::Base
  belongs_to :question_type
  belongs_to :choice
  has_many :answers, through: :choice
  has_many :survey_questions
  has_many :surveys, through: :survey_questions
  attr_accessible :content
end
