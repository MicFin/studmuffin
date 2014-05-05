class AddOrderToDietaryRestrictions < ActiveRecord::Migration
  def change
    add_column :dietary_restrictions, :order, :integer
  end
end
