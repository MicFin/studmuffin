class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :question_type
      t.belongs_to :choice
      t.string :title

      t.timestamps
    end
    add_index :questions, :question_type_id
    add_index :questions, :choice_id
  end
end
