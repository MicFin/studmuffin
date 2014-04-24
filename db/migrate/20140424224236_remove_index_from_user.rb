class RemoveIndexFromUser < ActiveRecord::Migration
  def up
    remove_index(:users, :name => 'index_users_on_email')
  end

  def down
    add_index(:users, :name => 'index_users_on_email')
  end
end
