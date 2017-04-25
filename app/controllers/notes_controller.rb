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
  	redirect_to note_path(@note.id)

  end

  def index
  	@notes = Note.all
  end

  def show
  	@note = Note.find(params[:id])
  end

end
