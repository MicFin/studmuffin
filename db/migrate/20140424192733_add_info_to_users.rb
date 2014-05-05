class AddInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age_months, :integer
    add_column :users, :sex, :string
    add_column :users, :height_inches, :integer
    add_column :users, :weight_ounces, :integer

    add_index :users, :age_months
    add_index :users, :weight_ounces
    add_index :users, :height_inches
  end
end
