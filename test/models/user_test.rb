# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  first_name      :string           not null
#  last_name       :string
#  email           :string           not null
#  designation     :string           not null
#  age             :integer          default(18)
#  gender          :string           not null
#  address         :text
#  twitter_url     :string
#  linkedin_url    :string
#  github_url      :string
#  organisation_id :bigint           not null
#  role_id         :bigint           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
