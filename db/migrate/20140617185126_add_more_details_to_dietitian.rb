class AddMoreDetailsToDietitian < ActiveRecord::Migration
  def change
    add_column :dietitians, :years_exp, :integer
  end
end
