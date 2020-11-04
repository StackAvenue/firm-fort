class Users::InvitationsController < Devise::InvitationsController
  before_action :authenticate_inviter!, only: [:new, :create, :pending]
  
  def create
    @user = User.new(user_params)
    @user.organisation_id = current_user.organisation_id
    @user.invitation_status = "Pending"
    @user.password = "password"
      if @user.valid? && @user.invite!
        @notice = "Invitation Sent"
        render 'new'
      else 
        render 'new'
      end
  end

  def pending
    @user = User.where(invitation_status: "Pending")
  end

  def resend
    @user = User.find(params[:id])
    @user.invite!
    redirect_to users_invitation_pending_path
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role_id, :organisation_id, :email, :id, :invitation_token, :invitation_status)
  end 
end
