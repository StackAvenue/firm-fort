class Users::RegistrationsController < Devise::RegistrationsController
 
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.role_id = Role.find_by(name: 'Member').id
    if @user.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :role_id, :organisation_id, :email, :password, :password_confirmation)
  end 
end
