FactoryBot.define do
  factory :role do
    name { random = ['SuperAdmin', 'Admin', 'Member'].sample }
    description { Faker::Lorem.word }
  end 
end 