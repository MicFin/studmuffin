class AddInputOptionToDietaryRestrictions < ActiveRecord::Migration
  def change
    add_column :dietary_restrictions, :input_option, :boolean
  end
end
