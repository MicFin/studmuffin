# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_survey, :class => 'UserSurveys' do
    survey nil
    user nil
  end
end
