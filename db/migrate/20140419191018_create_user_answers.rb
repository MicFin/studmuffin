class CreateUserAnswers < ActiveRecord::Migration
  def change
    create_table :user_answers do |t|
      t.belongs_to :user
      t.belongs_to :survey_question
      t.text :user_input

      t.timestamps
    end
    add_index :user_answers, :user_id
    add_index :user_answers, :survey_question_id
  end
end
