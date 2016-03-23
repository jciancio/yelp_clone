require 'faker'

FactoryGirl.define do
  factory :user do
    sequence(:name)  { |n| Faker::Name.name + n.to_s }
    password               { Faker::Internet.password(8) }
    sequence(:email)       { |n| n.to_s + Faker::Internet.free_email }

    factory :user_with_businesses do
      ignore do
        businesses_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:business, evaluator.businesses_count, users: [user])
      end
    end
  end
end
