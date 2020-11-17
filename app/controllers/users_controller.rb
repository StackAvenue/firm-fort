class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @pagy, @users = pagy(User.all)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
   
    redirect_to users_path
  end

  def search
    parameter = params[:name].titlecase
    @pagy, @users = pagy(User.where("first_name Like ? OR last_name Like ?", parameter, parameter))
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :age, :role_id, :organisation_id, 
                                :email, :password, :password_confirmation)
  end
end
