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
  test "first_name must be present" do
    user = build(:user, first_name: nil)
    assert_not user.valid?
    assert_equal(["can't be blank"], user.errors.messages[:first_name])
  end

  test "email must be present" do
    user = build(:user, email: nil)
    assert_not user.valid?
    assert_equal(["can't be blank"], user.errors.messages[:email]) 
  end

  test "designation must be present" do
    user = build(:user, designation: nil)
    assert_not user.valid?
    assert_equal(["can't be blank"], user.errors.messages[:designation])
  end
  
  test "deafult age is 18" do
    user = create(:user)
    assert_equal 18, user.age
  end

  test "gender must be male, female or other only" do
    user = build(:user, gender: Faker::Name.name)
    assert_not user.valid?
    assert_equal(["is not included in the list"], user.errors.messages[:gender])
  end

  test "organisation must be present" do
    user = build(:user, organisation: nil)
    assert_not user.valid?
    assert_equal(["must exist"], user.errors.messages[:organisation])
  end 
  
  test "role must be present" do
    user = build(:user, role: nil)
    assert_not user.valid?
    assert_equal(["must exist"], user.errors.messages[:role])
  end  

  test "save user successfully" do 
    user = create(:user)
    assert true, user.save
  end

  test "unique user in an organisation" do
    user1 = create(:user)

    user = build(:user, email: user1.email, organisation_id: user1.organisation_id)
    assert_not user.valid?
    assert_equal(["has already been taken"], user.errors.messages[:email])
  end
end
