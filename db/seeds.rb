# for i in 1..3
#   email = "user#{i}@example.com"
#   name = "User #{i}"
#   User.find_or_create_by_email email: email, password: 'changeme', fullname: name
# end

# User.create(email: "tara@kindrdfood.com", password: 'tararules', first_name: "Tara", last_name: "McCarthy", admin: true)

# User.create(email: "david@kindrdfood.com", password: 'davidrules', first_name: "David", last_name: "Constantine", admin: true)

# DietaryRestriction.create(name: "Wheat", category: "allergy", order: 9)
# DietaryRestriction.create(name: "Peanut", category: "allergy", order: 5)
# DietaryRestriction.create(name: "Milk", category: "allergy", order: 4)
# DietaryRestriction.create(name: "Tree Nut", category: "allergy", order: 8)
# DietaryRestriction.create(name: "Shellfish", category: "allergy", order: 7)
# DietaryRestriction.create(name: "Fish", category: "allergy", order: 3)
# DietaryRestriction.create(name: "Egg", category: "allergy", order: 2)
# DietaryRestriction.create(name: "Soy", category: "allergy", order: 8)
# DietaryRestriction.create(name: "Corn", category: "allergy", order: 1)
# DietaryRestriction.create(name: "Sesame", category: "allergy", order: 6)
# DietaryRestriction.create(name: "Other Allergy", category: "allergy", order: 10, input_option: true, description: "If an allergy affecting your family's diet isn't listed, please add it below! (Example: Chicken, Strawberry)")

# DietaryRestriction.create(name: "Gluten Intolerance (non-celiac)", category: "intolerance", order: 101, description: "")
# DietaryRestriction.create(name: "Lactose Intolerance", category: "intolerance", order: 102)
# DietaryRestriction.create(name: "Other Intolerance", category: "intolerance", order: 103, input_option: true, description: "If an intolerance affecting your family's diet isn't listed, please add it below! ")

# DietaryRestriction.create(name: "Celiac Disease", category: "disease", order: 202)
# DietaryRestriction.create(name: "Allergic Colitis", category: "disease", order: 201)
# DietaryRestriction.create(name: "Oral Allergy Syndrome", category: "disease", order: 207)
# DietaryRestriction.create(name: "EoE", category: "disease", order: 204, description: "Eosinophilic Esophogitis")
# DietaryRestriction.create(name: "FPIES", category: "disease", order: 205, description: "Food Protein Induced Enterocolitis Syndrome")
# DietaryRestriction.create(name: "IBS", category: "disease", order: 206, description: "Irritable Bowel Syndrome")
# DietaryRestriction.create(name: "Crohn's Disease", category: "disease", order: 203)
# DietaryRestriction.create(name: "Other Disease", input_option: true, category: "disease", order: 208, description: "If a disease affecting your family's diet isn't listed, please add it below!")
# DietaryRestriction.create(name: "Not Sure Yet", category: "none", order: 301)

# Survey.create(title: "First_Appt_Survey").questions << Question.create(answer_type: "open_response", choices: {"0" => "open response"}, content: "In a typical day, list what your child eats", question_order: 1) << Question.create(answer_type: "open_response", choices: {"0" => "open response"}, content: "Describe the challenges that lead you to this appointment", question_order: 2) << Question.create(answer_type: "open_response", choices: {"0" => "open response"}, content: "What is the single most important goal you want accomplished in your upcoming appointment", question_order: 3)

Survey.create(title: 'First_Tech_Survey').questions << Question.create(answer_type: 'multiple_choice', content: 'What web browser do you use?', question_order: 1, choices: {'1' => 'Chrome', '2' => 'FireFox', '3' => 'Safari', '4' => 'Internet Explorer', '4' => 'Not Sure'}) << Question.create(answer_type: 'yes/no', content: 'Do you have a webcam?', question_order: 2, choices: {'1' => 'Yes', '2' => 'No'}) << Question.create(answer_type: 'yes/no', content: 'Have you used your webcam before?', question_order: 3, choices: {'1' => 'Yes', '2' => 'No'})

