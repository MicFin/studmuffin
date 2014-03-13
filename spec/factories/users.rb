FactoryGirl.define do
  sequence :email do |n|
    "user-#{n}@example.com"
  end

  sequence :fullname do |n|
    "user #{n}"
  end

  factory :user do
    email
    password 'Passw0rd!1'
    fullname
  end

  factory :allergy do
    name 'soy'
  end

  factory :user_with_allergy, parent: :user do
    allergies { [FactoryGirl.create(:allergy)] }
  end
end
