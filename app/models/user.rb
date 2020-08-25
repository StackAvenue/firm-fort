class User < ApplicationRecord
  belongs_to :organisation
  belongs_to :role
  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :gender, inclusion: { in: %w(male female other) }
end
