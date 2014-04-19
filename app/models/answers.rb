class Answers < ActiveRecord::Base
  has_many :user_selected_answers
  has_many :user_answers, through: :user_selected_answers
  has_many :users, through: :user_answers
  has_many :choice_answers
  has_many :choices, through: :choice_answers 
  attr_accessible :content
end
