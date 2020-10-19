class Users::InvitationsController < Devise::InvitationsController
  
  def create
    @user = User.new(user_params)
    @user.organisation_id = current_user.organisation_id
    @user.invitation_status = "Pending"
    if @user.invite!
      redirect_to users_path
    else 
      render 'new'
    end
  end

  def pending
    @user = User.where(invitation_status: "Pending")
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role_id, :organisation_id, :email)
  end 
end
