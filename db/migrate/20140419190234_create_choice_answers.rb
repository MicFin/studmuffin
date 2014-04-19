class CreateChoiceAnswers < ActiveRecord::Migration
  def change
    create_table :choice_answers do |t|
      t.belongs_to :choice
      t.belongs_to :answer
      t.integer :order

      t.timestamps
    end
    add_index :choice_answers, :choice_id
    add_index :choice_answers, :answer_id
    add_index :choice_answers, :order
  end
end
