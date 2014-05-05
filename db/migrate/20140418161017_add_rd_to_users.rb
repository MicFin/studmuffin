class AddRdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rd, :boolean
  end
end
