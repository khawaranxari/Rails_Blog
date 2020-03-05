class UsersController < ApplicationController

	before_action :set_users_id, only: [:edit, :show, :update]

	def index
		@user = User.all	
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(params_users)
		if @user.save
			flash[:notice] = "Welcome to My Blog #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end 
	end

	def edit
		
	end

	def update
		if @user.update(user_params)
  		 	flash[:success] = "Your account was updated successfully"
   		 	redirect_to articles_path
  		else
   			render 'edit'
  		end
	end

	def show
		
	end

	private

	def params_users
		
		params.require(:user).permit(:username, :email, :password)
	end

	def set_users_id
		@user = User.find(params[:id])	
	end
end
