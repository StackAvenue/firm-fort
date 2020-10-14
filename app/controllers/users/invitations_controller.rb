class Users::InvitationsController < Devise::InvitationsController
  
  def create
    @user = User.new(user_params)
    @user.first_name = "First Name"
    @user.last_name = "last Name"
    @user.organisation_id = current_user.organisation_id
    if @user.invite!
      redirect_to users_path
    else 
      render 'new'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role_id, :organisation_id, :email)
  end 
  end