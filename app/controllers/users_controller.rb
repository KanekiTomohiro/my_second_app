class UsersController < ApplicationController

	#ログインしていないユーザがアクションを起こせないようにする
	before_action :authenticate_user!

	def new
		@user = User.new

	end

	def create
		@user = User.new(user_params)
		
  		# アップロードされる画像をparams[:user][:image]で受け取ってfileに代入
    	file = params[:image]
        @user.set_image(file)

        @user.name = params[:name]
  		@user.email = params[:email]
		@user.save

	end

	def index
		@users = User.all

	end

	def show
		@user = User.find(params[:id])
		@notes = Note.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	def update

		@user = User.find(params[:id])

		@user.name = params[:name]
		@user.email = params[:email]
		@user.save
		redirect_to user_path(@user.id)
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
		redirect_to users_path
	end

	private

	def user_params
      params.permit(:user).permit(:name, :email, :image)
    end

end
