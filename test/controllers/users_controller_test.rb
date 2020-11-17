require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  def setup
    @user = create :user
  end

  test "if user signed in should get index" do
    sign_in @user
    get :index
    assert_response :success
  end

  test "if user is not signed in should redirect to sign in page" do
    get :index
    assert_response :redirect
    assert_redirected_to '/users/sign_in'
  end

  test 'if user is found should destroy user' do
    sign_in @user
    assert_difference 'User.count', -1 do
      delete :destroy, params: {id: @user.id}
    end
    assert_redirected_to users_path
  end

  test 'if user is not found should raise RecordNotFound for deleting' do
    sign_in @user 
    assert_raises(ActiveRecord::RecordNotFound) do
      delete :destroy, params: {id: -1}
    end
  end

  test 'if user found should edit user' do
    sign_in @user
    user = create(:user)
    get :edit,  xhr: true, params: {id: user.id} 
    assert_response :success  
  end

  test 'if user is not found should raise RecordNotFound for editing' do
    sign_in @user 
    assert_raises(ActiveRecord::RecordNotFound) do
      get :edit, params: {id: -1}
    end
  end
end
