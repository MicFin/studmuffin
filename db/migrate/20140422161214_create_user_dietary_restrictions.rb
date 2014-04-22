class CreateUserDietaryRestrictions < ActiveRecord::Migration
  def change
    create_table :user_dietary_restrictions do |t|
      t.belongs_to :user
      t.belongs_to :dietary_restriction
      t.text :other_field

      t.timestamps
    end
    add_index :user_dietary_restrictions, :user_id
    add_index :user_dietary_restrictions, :dietary_restriction_id
  end
end
