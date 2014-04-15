class DropAllergiesJoinTable < ActiveRecord::Migration
  def up
    drop_table :users_allergies
  end

  def down
    create_table :users_allergies do |t|
      t.integer :allergy_id
      t.integer :user_id
      t.timestamps    
    end
  end
end

