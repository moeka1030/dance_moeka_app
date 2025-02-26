class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    @like = @post.likes.new(user: current_user)

    if @like.save
      redirect_back fallback_location: posts_path, notice: "いいねしました！"
    else
      redirect_back fallback_location: posts_path, alert: "いいねに失敗しました"
    end
  end

  def destroy
    @like = @post.likes.find_by(user: current_user)

    if @like&.destroy
      redirect_back fallback_location: posts_path, notice: "いいねを取り消しました"
    else
      redirect_back fallback_location: posts_path, alert: "いいねの取り消しに失敗しました"
    end
  end

  def index
    @liked_posts = current_user.liked_posts.includes(:user)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound
    redirect_back fallback_location: posts_path, alert: "投稿が見つかりません"
  end
end
