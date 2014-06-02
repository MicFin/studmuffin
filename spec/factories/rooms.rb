# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :room do
    name "MyString"
    sessionId "MyString"
    public false
  end
end
