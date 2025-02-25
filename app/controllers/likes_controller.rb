class LikesController < ApplicationController
 before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(user: current_user)
    if @like.save
      redirect_back fallback_location: posts_path, notice: "いいねしました！"
    else
      redirect_back fallback_location: posts_path, alert: "いいねに失敗しました"
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find_by(user: current_user)
    if @like
      @like.destroy
      redirect_back fallback_location: posts_path, notice: "いいねを取り消しました"
    else
      redirect_back fallback_location: posts_path, alert: "いいねの取り消しに失敗しました"
    end
  end

  def index
    @liked_posts = current_user.liked_posts.includes(:user)
  end
end
