class AddSpecialtiesToDietitian < ActiveRecord::Migration
  def change
    add_column :dietitians, :specialties, :text
  end
end
