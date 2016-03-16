require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:first_name)  { |n| Faker::Name.first_name + n.to_s }
    sequence(:last_name)   { |n| Faker::Name.last_name + n.to_s }
    password               { Faker::Internet.password(8) }
    sequence(:email)       { |n| n.to_s + Faker::Internet.free_email }
  end
end
