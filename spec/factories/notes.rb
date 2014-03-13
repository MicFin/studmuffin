FactoryGirl.define do
  factory :note do
    name 'Note title'
    content 'Body of the note'
    user
  end
end
