class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index # 投稿一覧
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  def show # 投稿詳細ページ
  end

  def new # 新規投稿ページ
    @post = Post.new
  end

  def create # 新規投稿
    @post = current_user.posts.build(post_params) # `build` を使って current_user に関連付ける
    if @post.save
      redirect_to user_profile_path, notice: '投稿が作成されました'
    else
      render :new
    end
  end

  def edit # 投稿編集
  end

  def update # 投稿更新
    if @post.update(post_params)
      redirect_to posts_path, notice: '投稿を更新しました'
    else
      render :edit
    end
  end

  def destroy # 投稿削除
    @post.destroy
    redirect_to posts_path, notice: '投稿が削除されました'
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id]) || not_found
  end

  def post_params
    params.require(:post).permit(:video, :genre, :description)
  end

  def authorize_user!
    return if @post.user == current_user

    redirect_to posts_path, alert: "この投稿を編集・削除する権限がありません"
  end

  def not_found
    redirect_to posts_path, alert: "投稿が見つかりません"
  end
end
