# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :survey_question, :class => 'SurveyQuestions' do
    survey nil
    question nil
    order 1
  end
end
