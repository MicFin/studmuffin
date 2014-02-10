class CreateUsersAllergiesJoinTable < ActiveRecord::Migration
  def change
    create_table :users_allergies, id: false do |t|
      t.integer :allergy_id
      t.integer :user_id
      t.timestamps
    end
  end
end
