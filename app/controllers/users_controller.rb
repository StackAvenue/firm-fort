class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def edit
    @users = User.find(params[:id])
  end
  
  def destroy
    @users = User.find(params[:id])
    @users.destroy
   
    redirect_to users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :role_id, :organisation_id, :email, :password, :password_confirmation)
  end
end
