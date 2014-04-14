class DropAllergiesTable < ActiveRecord::Migration
  def up
    drop_table :allergies
  end

  def down
    create_table :allergies do |t|
      t.string :name
      t.timestamps        
    end
  end
end

