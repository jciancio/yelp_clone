require 'faker'

FactoryGirl.define do
  factory :business do
    sequence(:name) { |n| Faker::Company.name + n.to_s }
    description Faker::Company.catch_phrase
    address Faker::Address.street_address
    city Faker::Address.city
    state Faker::Address.state
    zip Faker::Address.zip
    user
  end
end
