# == Schema Information
#
# Table name: roles
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class RoleTest < ActiveSupport::TestCase
  test "save role successfully" do 
    role = create(:role)
    assert true, role.save
  end

  test "name must be present" do
    role = build(:role, :name => nil)
    role.valid?
    assert_not_empty role.errors[:name]
  end
end
