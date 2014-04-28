class UserSurveysController < ApplicationController
  # def index
  #   @user_dietary_restrictions = Family.all
  # end

  # def show
  #   @user = current_user
  #   @family = Family.find(params[:id])
  #   @family_dietary_restrictions = @family.dietary_restrictions
  #   @family_members = @family.users 
  # end

  def new
    @user = current_user
    @user_survey = UserSurvey.new
    @survey = Survey.find(params["survey_id"].to_i)
    @survey_questions = @survey.questions
    @user_survey.user_survey_answers.build
    @user_survey_answer = UserSurveyAnswer.new
  end

  def edit
    @family = Family.find(params[:id])
  end

  def create
    @user = current_user
    @user_survey = UserSurvey.new(params["user_survey"])
    @user_survey.save
    if params["user_survey"]["survey_id"] == "2"
      redirect_to new_user_survey_path(survey_id: 3)
    else
      binding.pry
      render :show 
    end
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