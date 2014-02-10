for i in 1..3
  User.find_or_create_by_email email: "user#{i}@example.com", password: 'changeme'
end
Allergy.create(name: 'Wheat')
Allergy.create(name: 'Soy')
Allergy.create(name: 'Dairy')
Allergy.create(name: 'Egg')
Allergy.create(name: 'Peanut/Treenut')
Allergy.create(name: 'Fish/Shellfish')
