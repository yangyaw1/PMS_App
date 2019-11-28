User.create!(name:  "admin",
             email: "admin@gmail.com",
             password:              "admin123",
             password_confirmation: "admin123",
             admin: true)

20.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password123"
    User.create!(name:  name,
                 email: email,
                 password:              password,
                 password_confirmation: password)
    end

(1..20).each do |n|
    num = n*100
    Room.create!(num: num)
end
