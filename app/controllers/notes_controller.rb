class NotesController < ApplicationController
  def new
  end

  def create
  	# Noteクラスのインスタンスを生成し、変数@noteに代入
  	@note = Note.new

  	# セッターを用いて、フォームから受け取った値をセット
  	@note.title = params[:title]
  	@note.content = params[:content]

  	# saveメソッドでデータベースに保存してください
  	@note.save

  	#showアクションへのリダイレクト
  	redirect_to notes_path

  end

  def index
  	@notes = Note.all.order(created_at: :desc)
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
  	@note.save
  	redirect_to note_path(@note.id)
  end

  def destroy
  	@note = Note.find(params[:id])
  	@note.destroy
  	redirect_to notes_path
  end

end
