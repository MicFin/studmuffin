class ChangeColumnName < ActiveRecord::Migration
 def change
    rename_column :dietary_restrictions, :type, :category
  end
end
