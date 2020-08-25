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
  has_many :users
  validates :name, presence: true, uniqueness: true
end
