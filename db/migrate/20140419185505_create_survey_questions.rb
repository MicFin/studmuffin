class CreateSurveyQuestions < ActiveRecord::Migration
  def change
    create_table :survey_questions do |t|
      t.belongs_to :survey
      t.belongs_to :question
      t.integer :order

      t.timestamps
    end
    add_index :survey_questions, :survey_id
    add_index :survey_questions, :question_id
    add_index :survey_questions, :order
  end
end
