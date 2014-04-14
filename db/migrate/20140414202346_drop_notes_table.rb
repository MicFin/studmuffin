class DropNotesTable < ActiveRecord::Migration
  def up
    drop_table :notes
  end

  def down
    create_table :notes do |t|
      t.string :name
      t.text :content
      t.integer :user_id      
    end
  end
end