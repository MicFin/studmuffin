class AddMoreInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :more_info, :text
  end
end
