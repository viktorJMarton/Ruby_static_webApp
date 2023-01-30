User.create!(name: "example User",
             email:"exampleforreal@railstutoral.org",
             password: "foobar", 
             password_confirmation: "foobar",
             admin: true)
99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@raisltutorial.org"
    password ="pw123456"
    User.create!(name: name, email: email, password: password, password_confirmation:password)
end
