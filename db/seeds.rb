# for i in 1..3
#   email = "user#{i}@example.com"
#   name = "User #{i}"
#   User.find_or_create_by_email email: email, password: 'changeme', fullname: name
# end

User.create(email: "tara@kindrdfood.com", password: 'tararules', first_name: "Tara", last_name: "McCarthy", admin: true)

User.create(email: "david@kindrdfood.com", password: 'davidrules', first_name: "David", last_name: "Constantine", admin: true)

