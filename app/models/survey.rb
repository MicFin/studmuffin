class Survey < ActiveRecord::Base
  attr_accessible :title, :completed

  has_many :user_surveys
  has_many :users, through: :user_surveys
  has_many :questions, order: "question_order"
  # -> {order(:question_order)}
  #:include => :question_order, :question_order => "question_order"

  # def ordered_questions
  #   self.questions.order("order")
  # end

end
