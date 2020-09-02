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
class Role < ApplicationRecord
  #associations
  has_many :users

  #validations
  validates :name, presence: true
  validates :name, inclusion: { in: %w(SuperAdmin Admin Member) }
end
