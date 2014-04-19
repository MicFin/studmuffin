class Choice < ActiveRecord::Base
  has_many :questions
  has_many :choice_answers
  has_many :answers, through: :choice_answers
  attr_accessible :title
end
