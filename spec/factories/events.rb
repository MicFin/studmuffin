# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    title "MyString"
    description "MyString"
    startdate "2014-03-08 15:25:04"
    enddate "2014-03-08 15:25:04"
    allday "2014-03-08"
  end
end
