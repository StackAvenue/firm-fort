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
    user = build(:user, :first_name => nil)
    user.valid?
    assert_not_empty user.errors[:first_name]
  end

  test "email must be present" do
    user = build(:user, :email => nil)
    user.valid?
    assert_not_empty user.errors[:email] 
  end

  test "designation must be present" do
    user = build(:user, :designation => nil)
    user.valid?
    assert_empty user.errors[:designation]
  end
  
  test "age must be present" do
    user = build(:user, :age => nil)
    user.valid?
    assert_empty user.errors[:age]
  end

  test "organisation must be present" do
    user = build :user, organisation: nil
    user.valid?
    assert_not_empty user.errors[:organisation]
  end 
  
  test "role must be present" do
    user = build :user, role: nil
    user.valid?
    assert_not_empty user.errors[:role]
  end  

  test "save user successfully" do 
    user = create(:user)
    assert true, user.save
  end
end
