class RemoveChoiceFromUserSurveyAnswer < ActiveRecord::Migration
  def up
    remove_column :user_survey_answers, :choice
  end

  def down
    add_column :user_survey_answers, :choice, :text
  end
end
