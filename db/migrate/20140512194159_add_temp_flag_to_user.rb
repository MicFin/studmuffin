class AddTempFlagToUser < ActiveRecord::Migration
  def change
    add_column :users, :temp_flag, :boolean, default: false
  end
end
