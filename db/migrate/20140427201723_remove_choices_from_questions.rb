class RemoveChoicesFromQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :choices
  end

  def down
    add_column :questions, :choices, :text
  end
end
