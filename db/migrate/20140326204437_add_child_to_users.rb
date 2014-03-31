class AddChildToUsers < ActiveRecord::Migration
  def change
    add_column :users, :childname, :string, default: 'NA'
    add_column :users, :childheight, :integer, default: 9999
    add_column :users, :childweight, :integer, default: 9999
    add_column :users, :childdob, :date, default: '1901-01-01'
    add_column :users, :childhist, :text, default: 'NA'
    add_column :users, :childmeds, :text, default: 'NA'
  end
end
