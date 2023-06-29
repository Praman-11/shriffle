class UsersController < ApplicationController
	def new
		@user = User.new
	end
	def index
		@user = User.all
	end
	def create
		@user = User.new(users_params)
		if @user.save
			redirect_to controller: :users, action: :login
		else
			render :new, status: :unprocessable_entity
		end	  
	end
	 def show

	 	@user = User.find(params[:id])
	 end
	def login

	end

	def compare
	end

	private
	def users_params
		 params.require(:user).permit(:name, :email, :password, :status)
	end
end
