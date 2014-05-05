# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :choice_answer, :class => 'ChoiceAnswers' do
    choice nil
    answer nil
    order 1
  end
end
