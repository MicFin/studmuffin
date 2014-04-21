# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_survey_answer do
    user_survey nil
    question nil
    user_input "MyText"
    choice "MyString"
  end
end
