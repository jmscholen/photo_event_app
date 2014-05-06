class UsersController < ApplicationController
  #skip_filter :ensure_logged_in
  def index
    @users = User.all
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
      if @new_user.save
        redirect_to photos_path, notice: "You are Signed Up!"
      else
        render :new, notice: "You failed to Sign Up. Please try again."
      end

  end

  def edit
    @edit_user = User.find(params[:id])
  end

  def update
    @edit_user = User.find(params[:id])
    @edit_user.update_attributes(user_params)
    redirect_to user_path
  end

  def destroy
    @delete_user = User.find(params[:id])
    @delete_user.delete 
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :type, :email)# :password, :password_confirmation)
  end
end
