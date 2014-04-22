class CreateDietaryRestrictions < ActiveRecord::Migration
  def change
    create_table :dietary_restrictions do |t|
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
