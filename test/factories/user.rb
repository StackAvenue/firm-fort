FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    gender { random = ['male', 'female', 'other'].sample }
    address { Faker::Address.city }
    twitter_url {Faker::Internet.name}
    linkedin_url {Faker::Internet.name}
    github_url {Faker::Internet.name}
    password { Faker::Number.number(digits: 8) }
    association :organisation
    association :role
  end 
end 
