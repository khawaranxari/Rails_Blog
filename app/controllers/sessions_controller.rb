class SessionsController < ApplicationController

	def new
		
	end

	def create
		email = params[:session][:email].downcase
		user = User.find_by(email: email)	
		if user  && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			byebug

			flash[:success] = "You have logged in"
			redirect_to users_path(user)
		else
			flash.now[:danger] = "There was something wrong with your login information"
			render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "you have logged out"
		redirect_to root_path
	end
end