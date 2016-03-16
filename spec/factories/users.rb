require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| Faker::Name.name + n.to_s }
    password               { Faker::Internet.password(8) }
    sequence(:email)       { |n| n.to_s + Faker::Internet.free_email }
  end
end
