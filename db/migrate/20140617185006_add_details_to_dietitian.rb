class AddDetailsToDietitian < ActiveRecord::Migration
  def change
    add_column :dietitians, :undergrad, :string
    add_column :dietitians, :graduate, :string
    add_column :dietitians, :certifs, :text
    add_column :dietitians, :fav_eat, :string
    add_column :dietitians, :fav_cook, :string
    add_column :dietitians, :fav_snack, :string
    add_column :dietitians, :family_bio, :text
    add_column :dietitians, :dietary_bio, :text
    add_column :dietitians, :why_nutrition, :text
  end
end
