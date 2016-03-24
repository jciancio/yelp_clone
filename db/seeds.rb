# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

users = []
user_ids = Array.new ((1..10).map { |n| n.to_i }) * 8
businesses = []
businesses_ids = Array.new ((1..20).map { |n| n.to_i }) * 4
reviews = []

10.times do
  users << { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) }
end

20.times do |n|
  businesses << { name: Faker::Company.name, description: Faker::Company.catch_phrase,
                  address: Faker::Address.street_address, city: Faker::Address.city,
                  state: Faker::Address.state, zip: Faker::Address.zip, user_id: user_ids[n] }
end

80.times do |n|
  reviews << { title: Faker::Hacker.say_something_smart, description: Faker::Hipster.paragraph(3, false),
               business_id: businesses_ids[n], user_id: user_ids[n] }
end

users.each do |user|
  User.create! name: user[:name], email: user[:email],
               email_confirmation: user[:email],
               password: user[:password],
               password_confirmation: user[:password]
end

businesses.each do |business|
  Business.create! name: business[:name], description: business[:description],
                   address: business[:address], city: business[:city],
                   state: business[:state], zip: business[:zip],
                   user_id: business[:user_id]
end

reviews.each do |review|
  Review.create! title: review[:title], description: review[:description],
                 business_id: review[:business_id], user_id: review[:business_id]
end
