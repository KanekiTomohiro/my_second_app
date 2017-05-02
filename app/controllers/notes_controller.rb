class NotesController < ApplicationController

  #ユーザがログインしているかどうか
  before_action :authenticate_user!

  before_action :correct_user, only: [:edit, :update]

  before_action :set_note, only:[:show, :edit, :update, :destroy]

  # def new
  # 	#newでインスタンスを作っておくことで投稿に失敗した時の初期値をフォームに表示させることができる
  # 	@note = Note.new
  # end

  def create
    @note = current_user.notes.build(note_params)

    if @note.save
      redirect_to @note, notice: "投稿が保存されました"
    else
 
    @notes =Note.all.order(created_at: :desc)
      
    # renderメソッドで表示するビューが、トップページに
    render 'home/top'
      
    end
  end

  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def show
  end

  def edit
  end

  def update
    # @note = Note.new(note_params)
    # @note.title = params[:note][:title]
    # @note.content = params[:note][:content]
    # @note.save

    # showアクションにリダイレクト
    # redirect_to note_path(@note.id)

    # updateメソッドを使うことでセッターに値を入れてsaveしてーを簡単にできる
    if @note.update(note_params)
      redirect_to @note, notice: '投稿が更新されました'
    else
      render :edit
    end
  end

  def destroy
    @note.destroy

    #indexアクションにリダイレクト
    redirect_to notes_path, notice: '投稿が削除されました'
  end

  private

  def set_note
  	@note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :content)
  end

  def correct_user
    note = Note.find(params[:id])
    # noteを投稿したユーザーを取得し、current_user?メソッドの引数に渡してください
      if !current_user?(note.user)
        redirect_to root_path, alert: '許可されていないページです'
      end
  end

end
