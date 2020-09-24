require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  def setup
    super
    @user = create :user
  end

  test "if user signed in should get dashboard" do
    sign_in @user
    get :dashboard
    assert_response :success
  end

  test "if user is not signed in should redirect to sign in page" do
    get :dashboard
    assert_response :redirect
    assert_redirected_to '/users/sign_in'
  end
end
