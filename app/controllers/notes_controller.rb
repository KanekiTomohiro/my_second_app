class NotesController < ApplicationController
  
  #ログインしていないユーザがアクションを起こせないようにする
  # before_action :authenticate_user!


  def new
  end

  def create
  	# Noteクラスのインスタンスを生成し、変数@noteに代入
  	@note = Note.new(note_params)

  	# セッターを用いて、フォームから受け取った値をセット
  	@note.title = params[:title]
  	@note.content = params[:content]
  	# @note.user_id = params[:current_user_id]
  	@note.user_id = current_user.id

  	# saveメソッドでデータベースに保存してください
  	@note.save

  	#showアクションへのリダイレクト
  	# redirect_to notes_path

  end

  def index
  	@notes = Note.all.order(created_at: :desc).page(params[:page]).per(10).order(:id)
  end

  def show
  	@note = Note.find(params[:id])
  end

  def edit
  	@note = Note.find(params[:id])
  end

  def update
  	@note = Note.find(params[:id])
  	@note.title = params[:title]
  	@note.content = params[:content]
    p "aaaaaaaaaaaaaaaaaaaa"
    p "#{@note.title}"
    p "#{@note.content}"
  	@note.save
  	redirect_to note_path(@note.id)
  end

  def destroy
  	@note = Note.find(params[:id])
  	@note.destroy
  	redirect_to notes_path
  end

  private

    def note_params
      params.permit(:note).permit(:title, :content, :user_id)
    end

end
