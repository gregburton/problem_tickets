# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

50.times do
  User.create(name: Faker::Name.name,
              email: Faker::Internet.email,
              password: "password",
              password_confirmation: "password")
end

15.times do
  Problem.create(description: "#{["How would I", "Can someone tell me how to"].sample} #{Faker::Company.bs}?",
                 attempt: "I've tried to #{Faker::Company.bs} and #{Faker::Company.bs}, but #{["I'm stuck", "I can't figure it out"].sample}!",
                 user_id: rand(1..50),
                 created_at: rand(1.year).ago)
end

35.times do
  Note.create(text: "#{["Have you tried to", "What if you"].sample} #{Faker::Company.bs}? Then you can #{Faker::Company.bs}!",
              user_id: rand(1..50),
              problem_id: rand(1..15))
end
