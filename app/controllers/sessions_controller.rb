class SessionsController < ApplicationController
	#skip_filter :ensure_logged_in

	def new
	end

	def create
		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
		if user
			session[:user_id] = user.id 
			redirect_to new_user_path, notice: "You are Logged In!"
		else
			flash.now.alert = "Invalide email or password"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to login_path, notice: "You are logged out!"
	end
end
