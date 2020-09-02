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
    organisation = build(:organisation, :name => nil)
    organisation.valid?
    assert_not_empty organisation.errors[:name]
  end

  test "name must be unique " do
    organisation1 = create(:organisation)
    assert true, organisation1.save

    organisation = build(:organisation, :name => organisation1.name)
    organisation.valid?
    assert_not_empty organisation.errors[:name]
  end
end
