# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user_dietary_restriction do
    user nil
    dietary_restriction nil
    other_field "MyText"
  end
end
