class UsersController < ApplicationController
  def index
    @users = User.new
  end

  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(params_for_user)
      if @new_user.save
        redirect_to photos_path, notice: "You are Signed Up!"
      else
        render :new, notice: "You failed to Sign Up. Please try again."
      end

  end

  def edit
    @edit_user = User.find(params[:id])
    @edit_user.update_attributes(params_for_user)
    redirect_to users_path
  end

  def update
    @edit_user = User.find(params[:id])
    @edit_user.update_attributes(params_for_user)
    redirect_to user_path
  end

  def destroy
    @delete_user = User.find(params[:id])
    @delete_user.delete 
    redirect_to users_path
  end

  private

  def params_for_user
    params.require(:user).permit(:name, :type, :email, :password)
  end
end
