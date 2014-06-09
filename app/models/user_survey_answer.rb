class UserSurveyAnswer < ActiveRecord::Base
  belongs_to :user_survey
  belongs_to :question
  attr_accessible :choices, :user_input, :question_id, :user_survey_id
  # must make choice a hstop
  serialize :choices, ActiveRecord::Coders::Hstore.new({})

  def list_of_choices
    self.choices 
    choices_list = []
    self.choices.each do |key, choice|
      choices_list << choice
    end
    count = choices_list.count
    if count > 2
      choices_list.map! { |x| x + "," } 
      choices_list[count-1].gsub!(/\,/,'')
    end
    if count > 1
      choices_list.insert(-2, "and")
    end
    choices_list = choices_list.join(" ")
  end
end
