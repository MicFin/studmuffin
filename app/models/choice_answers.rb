class ChoiceAnswers < ActiveRecord::Base
  belongs_to :choice
  belongs_to :answer
  attr_accessible :order
end
