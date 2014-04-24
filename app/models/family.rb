class Family < ActiveRecord::Base
  belongs_to :head_of_family, :class_name => "User", :foreign_key => "user_id"

  attr_accessible :location, :name, :head_of_family_id
  has_many :user_families
  has_many :users, through: :user_families
  accepts_nested_attributes_for :users
  
  def dietary_restrictions
    family_restrictions = []
    self.users.each do |family_member|
      if family_member.dietary_restrictions.count >= 1 
        family_member.dietary_restrictions.each do |dietary_restriction|
          family_restrictions << dietary_restriction
        end
      end
    end
    return family_restrictions.uniq
  end

end
