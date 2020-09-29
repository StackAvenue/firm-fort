class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      redirect_to users_path
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
   
    redirect_to users_path
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :age, :role_id, :organisation_id, :email, :password, :password_confirmation)
  end
end
