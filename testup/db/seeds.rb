# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Ian Charles",
             email: "iancharles@maily.com",
             password:              "charles86",
             password_confirmation: "charles86",
             teacher: true)

99.times do |n|
  name  = Faker::Name.name
  email = "test-user-#{n+1}@maily.com"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

#users = User.order(:created_at).take(25)
#users.each { |user| user.exams.create!(course: 'CS6359', location: 'ECS 2.311', seats: 50, date: '10/12/2016', time: '11:30') }
