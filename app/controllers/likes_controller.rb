class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    post = Post.find(params[:post_id])
    current_user.likes.create(post: post)
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js # create.js.erb を探す,非同期処理
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post: post.id)
    like.destroy if like
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js # destroy.js.erb を探す
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
