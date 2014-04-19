# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_answer, :class => 'UserAnswers' do
    user nil
    survey_question nil
    user_input "MyText"
  end
end
