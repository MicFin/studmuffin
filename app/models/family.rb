class Family < ActiveRecord::Base
  belongs_to :head_of_family, :class_name => "User", :foreign_key => "user_id"
  attr_accessible :location, :name
  has_many :user_families
  has_many :users, through: :user_families
end
