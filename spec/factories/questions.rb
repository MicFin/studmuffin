# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question, :class => 'Questions' do
    question_type nil
    choice nil
    title "MyString"
  end
end
