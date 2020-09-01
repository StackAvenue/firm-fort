FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    designation { Faker::Lorem.word }
    age { Faker::Number.number(digits:2) }
    gender { random = ['male', 'female', 'other'].sample }
    address { Faker::Address.city }
    twitter_url {Faker::Internet.name}
    linkedin_url {Faker::Internet.name}
    github_url {Faker::Internet.name}
    association :organisation
    association :role
  end 
end 