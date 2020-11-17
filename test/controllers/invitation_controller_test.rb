require 'test_helper'

class Users::InvitationsControllerTest < ActionController::TestCase
  include ActionMailer::TestHelper

  def setup
    @user = create :user
    @new_user = build(:user, organisation_id: @user.organisation_id, password: nil)
  end
  
  test 'user should be created when inviting a new user' do
    assert_difference 'User.count', 1 do
      @new_user.invite!(@user)
    end
  end

  test 'email should be sent when inviting a new user' do
    assert_emails 1 do
      @new_user.invite!(@user)
    end
  end

  test 'user should update his password to accept invitation' do
    @new_user.invite!(@user)
    @new_user.password = Faker::Number.number(digits: 8)
    @new_user.password_confirmation =  @new_user.password
    assert true,  @new_user.accept_invitation!
  end

  test 'resend invitation email to user' do
    assert_emails 2 do
      @new_user.invite!(@user)
      @new_user.invite!(@user)
    end
  end
end
