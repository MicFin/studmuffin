class AddDietitianIdToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :dietitian_id, :integer
  end
end
