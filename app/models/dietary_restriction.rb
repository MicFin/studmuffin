class DietaryRestriction < ActiveRecord::Base
  attr_accessible :name, :category, :order, :description, :input_option
  has_many :user_dietary_restrictions
  has_many :users, through: :user_dietary_restrictions
  
  def self.regular_allergies
    regular_allergies=[]
    self.all.each do |allergy|
      if allergy.name != "Not Sure Yet"
        if allergy.category.downcase == "allergy"
          regular_allergies << allergy
        end
      end  
    end
    return regular_allergies
  end

  def self.intolerances
    intolerances=[]
    self.all.each do |allergy|
      if allergy.name != "Not Sure Yet"
        if allergy.category.downcase == "intolerance"
          intolerances << allergy
        end
      end  
    end
    return intolerances
  end

  def self.diseases
    diseases=[]
    self.all.each do |allergy|
      if allergy.name != "Not Sure Yet"
        if allergy.category.downcase == "disease"
          diseases << allergy
        end
      end  
    end
    return diseases
  end

  def user_input(user_id)
    if self.input_option == true
      other = UserDietaryRestriction.find(dietary_restriction_id: self.id, user_id: user_id).other_field
      return other
    end
    false
  end
end
