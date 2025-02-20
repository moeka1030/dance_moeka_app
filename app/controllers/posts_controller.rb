class PostsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create, :edit, :update, :destroy]

  def index #投稿一覧
    @posts = Post.all.include(:user)
  end

  def show #profileページ
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create #新規投稿
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to posts_path , notice: '投稿が作成されました'
    else
        render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:contents, :video_url)
  end
end
