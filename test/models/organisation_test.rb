# == Schema Information
#
# Table name: organisations
#
#  id          :bigint           not null, primary key
#  name        :string           not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'test_helper'

class OrganisationTest < ActiveSupport::TestCase
  test "save organisation successfully" do 
    organisation = create(:organisation)
    assert true, organisation.save
  end

  test "name must be present" do
    organisation = build(:organisation, name: nil)
    assert_not organisation.valid?
    assert_equal(["can't be blank"],organisation.errors.messages[:name])
  end

  test "name must be unique " do
    organisation1 = create(:organisation)
    
    organisation = build(:organisation, name: organisation1.name)
    assert_not organisation.valid?
    assert_equal(["has already been taken"], organisation.errors.messages[:name])
  end
end

