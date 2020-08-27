#seed for user

$LOAD_PATH << '.'
require 'db/seeds/organisation.seed_data.rb'
require 'db/seeds/role.seed_data.rb'

class SeedUser
  def self.create_user
    user = User.new(
      :first_name        => "Apeksha",
      :last_name         => "Singh",
      :email             => "apekshasingh664@gmail.com",
      :designation       => "SuperAdmin",
      :age               => 21,
      :gender            => "female",
      :address           => "xyz",
      :twitter_url       => "abc",
      :linkedin_url      => "abc",
      :github_url        => "abc",
      :organisation_id   => Organisation.first.id,
      :role_id           => Role.first.id
    )
    user.save!
  end
end