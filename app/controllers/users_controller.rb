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
   
    redirect_back fallback_location: '/'
  end

  def search
    parameter = params[:name].titlecase
    search_user = User.where("(invitation_status = 'Accepted' OR invitation_status IS NULL ) AND 
        ((first_name Like ?  OR last_name Like ?  ) OR CONCAT_WS(' ', first_name, last_name) LIKE ?)", 
        parameter, parameter, parameter)
    @pagy, @users = pagy(search_user)
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :age, :role_id, :organisation_id, 
                                :email, :password, :password_confirmation)
  end
end
