class AddChoicesToUserSurveyAnswers < ActiveRecord::Migration
  def change
    add_column :user_survey_answers, :choices, :hstore
  end
end
