class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :user_survey_answers
  attr_accessible :answer_type, :content, :question_order, :choices
  serialize :choices, ActiveRecord::Coders::Hstore.new({})

end
