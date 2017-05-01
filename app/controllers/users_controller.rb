class UsersController < ApplicationController

	#ログインしていないユーザがアクションを起こせないようにする
	# before_action :authenticate_user!

	def new
	end

  # def create
  #   @user = User.new(user_params)
  #   file = params[:user][:image]
  #   @user.set_image(file)

  #   if @user.save
  #     redirect_to @user, notice: 'ユーザーが保存されました'
  #   else
  #     render :new
  #   end
  # end

	def create
    @user = User.new(user_params)
    @user.name = params[:name]
  	@user.email = params[:email]
  	
    # file = params[:user][:image]
    # @user.set_image(file)

    @user.save

  end

	def index
		@users = User.all.order(created_at: :desc)

	end

	def show
		@user = User.find(params[:id])
		@notes = Note.where(user_id: @user.id)
	end

	def edit
		@user = User.find(params[:id])
	end

	# def update
	# 	@user = User.find(params[:id])
 #    	@user.name = params[:name]
	# 	@user.email = params[:email]
	# 	p "aaaaaaaaaaaaaaaaaaaa"
	# 	p "#{@user.name}"
	# 	p "#{@user.email}"

	# 	@user.save

	# 	# file = params[:user][:image]
 # 		# @user.set_image(file)

 #    	redirect_to user_path(@user.id)
 #  end

	def update
		@user = User.find(params[:id])
		p "aaaaaaaaaaaaaaaaaaaa"
		p "#{@user}"
		@user.name = params[:name]
		@user.email = params[:email]
	 	p "bbbbbbbbbbbbb"
		p "#{@user.name}"
		p "#{@user.email}"
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
