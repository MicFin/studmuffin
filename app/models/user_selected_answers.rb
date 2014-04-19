class UserSelectedAnswers < ActiveRecord::Base
  belongs_to :user_answer
  belongs_to :answer
  # attr_accessible :title, :body
end
