class UserSurvey < ActiveRecord::Base
  belongs_to :user
  belongs_to :survey
  has_many :user_survey_answers

  attr_accessible :completed, :completed_at, :user_survey_answers_attributes, :user_id, :survey_id

  accepts_nested_attributes_for :user_survey_answers, :reject_if => :all_blank, :allow_destroy => true, :reject_if => :no_answer

  def no_answer(attributes)
    if attributes[:choices].blank?
      if Question.find(attributes["question_id"].to_i).answer_type = "open_response"
        return false
      end
      return true
    end
    return false
  end

end
