# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :question do
    survey nil
    type ""
    choices "MyText"
  end
end
