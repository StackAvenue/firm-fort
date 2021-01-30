class Users::InvitationsController < Devise::InvitationsController
  before_action :authenticate_inviter!, only: [:new, :create, :pending]
  
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.valid? && @user.invite!
        format.html { redirect_to users_path, notice: "Invitation Sent" }
      else
        format.js { render 'new'}
      end
    end
  end

  def pending
    @pagy, @pending_users = pagy(User.where(invitation_status: "Pending"), items: 7)
    authorize! :pending, @pending_users
  end

  def resend
    @user = User.find(params[:id])
    @user.invite!
    redirect_to users_invitation_pending_path, notice: "Invitation Sent" 
  end

  def search
    parameter = params[:name].titlecase
    search_pending_user = User.where("(invitation_status = 'Pending') AND 
            ((first_name Like ? OR last_name Like ?) OR CONCAT_WS(' ', first_name, last_name) LIKE ?)",
            parameter, parameter, parameter)
    @pagy, @pending_users = pagy(search_pending_user, items: 7)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :role_id, :organisation_id, :email, 
                  :id, :invitation_token, :invitation_status, :password)
  end 
end
