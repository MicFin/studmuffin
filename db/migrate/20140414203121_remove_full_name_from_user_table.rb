class RemoveFullNameFromUserTable < ActiveRecord::Migration
  def up
    remove_column :user_tables, :fullname
  end

  def down
    add_column :user_tables, :fullname, :string
  end
end
