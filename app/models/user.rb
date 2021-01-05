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
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]
  #associations
  belongs_to :organisation
  belongs_to :role

  #validations
  validates :first_name, presence: true
  validates :gender, inclusion: { in: %w(male female other) }, allow_blank: true
  validates :role, presence: true
  validates :organisation, presence: true
  validates :email, presence: true

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    unless user
      user = User.create(first_name: data['first_name'],
        email: data['email'],
        password: Devise.friendly_token[0,20])
    end
    user
  end
end

