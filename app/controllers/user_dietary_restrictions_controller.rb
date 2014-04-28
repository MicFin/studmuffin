class UserDietaryRestrictionsController < ApplicationController
  # def index
  #   @user_dietary_restrictions = Family.all
  # end

  def show
    @user = current_user
    @family = Family.find(params[:id])
    @family_dietary_restrictions = @family.dietary_restrictions
    @family_members = @family.users 
  end

  def new
    @user = current_user
    @user_dietary_restriction = UserDietaryRestriction.new
    @family_members = @user.families.last.users
    @allergies = DietaryRestriction.regular_allergies
    @intolerances = DietaryRestriction.intolerances
    @diseases = DietaryRestriction.diseases
    @not_sure = DietaryRestriction.find_by_name("Not Sure Yet")
  end

  def edit
    @family = Family.find(params[:id])
  end

  def create
    params["user"].each do |user, allergy_array|
      if !params["user"][user]["more"].blank?
        User.find(user.to_i).update_attributes(more_info: params["user"][user]["more"])
      end
      if allergy_array["allergies"]
        allergy_array["allergies"].each do |allergy|
          if DietaryRestriction.find(allergy.to_i).input_option == true
            binding.pry
            @new_restriction = UserDietaryRestriction.new(user_id: user.to_i, dietary_restriction_id: allergy.to_i, other_field: params["user"][user]["other"][allergy])
            @new_restriction.save
          else
            @new_restriction = UserDietaryRestriction.new(user_id: user.to_i, dietary_restriction_id: allergy.to_i)
            @new_restriction.save
          end
        end
      end
    end
    @user = current_user
    redirect_to new_appointment_path
  end

  def update
    @family = Family.find(params[:id])
    @family.update_attributes(params[:family])
    @family.save
    redirect_to root_path(anchor: 'profile')
  end

  def destroy
    @family = Family.find(params[:id])
    @family.destroy
    redirect_to user_dietary_restrictions_path
  end
end