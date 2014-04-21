# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_selected_answer, :class => 'UserSelectedAnswers' do
    user_answer nil
    answer nil
  end
end
