class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.belongs_to :survey
      t.string :type
      t.text :choices
      t.text :content
      t.timestamps
    end
    add_index :questions, :survey_id
  end
end
