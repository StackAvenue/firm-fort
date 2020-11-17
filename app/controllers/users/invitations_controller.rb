class Users::InvitationsController < Devise::InvitationsController
  before_action :authenticate_inviter!, only: [:new, :create, :pending]
  
  def create
    @user = User.new(user_params)
    @notice = "Invitation Sent" if @user.valid? && @user.invite!
    render 'new'
  end

  def pending
    @pagy, @pending_users = pagy(User.where(invitation_status: "Pending"))
  end

  def resend
    @user = User.find(params[:id])
    @user.invite!
    redirect_to users_invitation_pending_path, notice: "Invitation Sent" 
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role_id, :organisation_id, :email, 
                  :id, :invitation_token, :invitation_status, :password)
  end 
end
