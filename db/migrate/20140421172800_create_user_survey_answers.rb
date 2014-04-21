class CreateUserSurveyAnswers < ActiveRecord::Migration
  def change
    create_table :user_survey_answers do |t|
      t.belongs_to :user_survey
      t.belongs_to :question
      t.text :user_input
      t.integer :choice

      t.timestamps
    end
    add_index :user_survey_answers, :user_survey_id
    add_index :user_survey_answers, :question_id
  end
end
