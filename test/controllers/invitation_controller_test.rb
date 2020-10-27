require 'test_helper'

class Users::InvitationsControllerTest < ActionController::TestCase
  include ActionMailer::TestHelper

  def setup
    @user = create :user
    @new_user = build(:user, organisation_id: @user.organisation_id, password: nil)
  end
  
  test 'user should be created when inviting a new user' do
    user = @new_user
    assert_difference 'User.count', 1 do
      user.invite!(@user)
    end
  end

  test 'email should be sent when inviting a new user' do
    user = @new_user
    assert_emails 1 do
      user.invite!(@user)
    end
  end

  test 'user should update his password to accept invitation' do
    user = @new_user
    user.invite!(@user)
    user.password = Faker::Number.number(digits: 8)
    user.password_confirmation = user.password
    assert true, user.accept_invitation!
  end

  test 'resend invitation email to user' do
    user = @new_user
    assert_emails 2 do
      user.invite!(@user)
      user.invite!(@user)
    end
  end
end
