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
class Organisation < ApplicationRecord
  #associations
  has_many :users

  #validations
  validates :name, presence: true, uniqueness: true
end
