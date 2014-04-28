class AddChoicesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :choices, :hstore
  end
end
