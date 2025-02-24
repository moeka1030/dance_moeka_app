class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index #投稿一覧
    @posts = Post.all.includes(:user).order(created_at: :desc)
  end

  def show #profileページ
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create #新規投稿
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to user_path(current_user) , notice: '投稿が作成されました'
    else
        render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました'
  end
  

  private

  def post_params #更新するデータを取得する（postに関するデータ・commentとビデオカラムの編集のみ許可）
    params.require(:post).permit(:video, :genre, :description)
  end
end
