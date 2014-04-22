class CreateUserFamilies < ActiveRecord::Migration
  def change
    create_table :user_families do |t|
      t.belongs_to :user
      t.belongs_to :family

      t.timestamps
    end
    add_index :user_families, :user_id
    add_index :user_families, :family_id
  end
end
