FactoryBot.define do
  factory :role do
    name { random = ['superadmin', 'admin', 'member'].sample }
    description { Faker::Lorem.word }
  end 
end 