#seed for user

$LOAD_PATH << '.'
require 'db/seeds/organisation.seed_data.rb'
require 'db/seeds/role.seed_data.rb'

class User
  def self.seed
    user = User.new(
      first_name:        "Apeksha",
      last_name:         "Singh",
      email:             "apekshasingh664@gmail.com",
      designation:       "SuperAdmin",
      age:                21,
      gender:            "female",
      address:           "xyz",
      password:          "123456",
      twitter_url:       "abc",
      linkedin_url:      "abc",
      github_url:        "abc",
      organisation_id:   Organisation.first.id,
      role_id:           Role.first.id
    )
    user.save!
  end
end