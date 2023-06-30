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
		@user = User.find_by(email: params[:email],password: params[:password])
		if @user.nil?
			flash[:error] = "email or password is incorrect ."
			redirect_to :login
		else
			puts "Login Successfull"
			session[:user_session] = @user.name
			redirect_to  "/welcome" #controller: :users, action: :welcome
		end
	end

	def welcome
		if session[:user_session].nil?
			# p session[:name]
			redirect_to root_url
		end
	end

	def logout
		session[:user_session] = nil
		p session[:user_session]
		# if @user = nil
        redirect_to  root_path #controller: :users, action: :login , status: :see_other
	end

	private
	def users_params
		 params.require(:user).permit(:name, :email, :password, :status)
	end
end
