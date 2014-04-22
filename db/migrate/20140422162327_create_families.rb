class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :location
      t.belongs_to :head_of_family, :class_name => "User", :foreign_key => "user_id"
      t.timestamps
    end
    add_index :families, :head_of_family_id
  end
end
