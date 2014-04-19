class CreateUserSelectedAnswers < ActiveRecord::Migration
  def change
    create_table :user_selected_answers do |t|
      t.belongs_to :user_answer
      t.belongs_to :answer

      t.timestamps
    end
    add_index :user_selected_answers, :user_answer_id
    add_index :user_selected_answers, :answer_id
  end
end
