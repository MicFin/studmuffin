class CreateUserSurveys < ActiveRecord::Migration
  def change
    create_table :user_surveys do |t|
      t.belongs_to :survey
      t.belongs_to :user
      t.integer :order
      t.timestamps
    end
    add_index :user_surveys, :survey_id
    add_index :user_surveys, :user_id
    add_index :user_surveys, :order
  end
end
