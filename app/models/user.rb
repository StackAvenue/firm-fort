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
class User < ApplicationRecord
  #associations
  belongs_to :organisation
  belongs_to :role

  #validations
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, inclusion: { in: %w(male female other) }
end
