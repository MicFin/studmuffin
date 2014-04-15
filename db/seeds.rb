for i in 1..3
  email = "user#{i}@example.com"
  name = "User #{i}"
  User.find_or_create_by_email email: email, password: 'changeme', fullname: name
end
