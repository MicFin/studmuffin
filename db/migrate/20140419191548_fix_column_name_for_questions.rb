class FixColumnNameForQuestions < ActiveRecord::Migration
  def change
    rename_column :questions, :title, :content
  end
end
