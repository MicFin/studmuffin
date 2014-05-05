class AddDescriptionToDietaryRestrictions < ActiveRecord::Migration
  def change
    add_column :dietary_restrictions, :description, :text
  end
end
