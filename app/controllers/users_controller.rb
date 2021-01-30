class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @pagy, @users = pagy(User.all)
    authorize! :index, @users
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to request.referrer, notice: "Updated Successfully" }
      else
        format.js { render "edit" }
      end
    end
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: "Deleted Successfully"
  end

  def search
    parameter = params[:name].titlecase
    search_user = User.where("(invitation_status = 'Accepted' OR invitation_status IS NULL ) AND 
        ((first_name Like ?  OR last_name Like ?  ) OR CONCAT_WS(' ', first_name, last_name) LIKE ?)", 
        parameter, parameter, parameter)
    @pagy, @users = pagy(search_user)
  end
  
  def profile
    @user = User.find(params[:id])
  end

  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :age, :role_id, :organisation_id, 
                                :email, :password, :password_confirmation, :image)
  end
end
