class UsersController < ApplicationController

  #ユーザがログインしているかどうか
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]
  before_action :set_user, only: [:show, :edit, :update, :destroy]



  def index
    @users = User.all
  end

  def show
    # @userのidをuser_idとしてもつnoteを@notesに代入
    # @userはbefore_actionで定義済み

    # @notes = Note.where(user_id: @user.id)
    #has_manyで定義したから使える

    @notes = @user.notes

  end

  #deviseのフォームがあるためいらない
  # def new
  #   @user = User.new
  # end

  def edit
  end

  #deviseのフォームがあるためいらない
  # def create
  #   @user = User.new(user_params)
  #   # アップロードされる画像をparams[:user][:image]で受け取る
  #   file = params[:user][:image]

  #   @user.set_image(file)

  #   if @user.save
  #     redirect_to @user, notice: 'ユーザーが保存されました'
  #   else
  #     render :new
  #   end
  # end

  def update
    file = params[:user][:image]
    @user.set_image(file)

    if @user.update(user_params)
      redirect_to @user, notice: 'ユーザー情報が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_url, notice: 'ユーザーが削除されました'
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :email)
    end

    def correct_user
      user = User.find(params[:id])
      # if文をcurrent_user?ヘルパーを用いて書き換えてください
      if !current_user?(user)
        redirect_to root_path, alert: '許可されていないページです'
      end
    end
    
end
