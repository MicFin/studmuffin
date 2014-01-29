for i in 1..3
  User.find_or_create_by_email email: "user#{i}@example.com", password: 'changeme'
end
