# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'faker'

users = [ { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) },
          { name: Faker::Name.name, email: Faker::Internet.safe_email, password: Faker::Internet.password(8) }
         ]

users.each do |user|
  User.create! name: user[:name], email: user[:email],
               email_confirmation: user[:email],
               password: user[:password],
               password_confirmation: user[:password]
end
