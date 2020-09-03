FactoryBot.define do
  factory :organisation do
    name { Faker::Name.unique.name }
    description { Faker::Lorem.word }
  end 
end 