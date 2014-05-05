class ChangeQuestionColumnName < ActiveRecord::Migration
 def change
    rename_column :questions, :type, :answer_type
  end
end
