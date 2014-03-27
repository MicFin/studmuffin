class AddChildToUsers < ActiveRecord::Migration
  def change
    add_column :users, :childname, :string
    add_column :users, :childheight, :integer
    add_column :users, :childweight, :integer
    add_column :users, :childdob, :date
    add_column :users, :childhist, :text
    add_column :users, :childmeds, :text
  end
end
