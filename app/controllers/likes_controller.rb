class LikesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    current_user.user.likes.create(post: post)
    redirect_to posts_path
  end

  def destroy
    post = Post.find(params[:post_id])
    like = current_user.likes.find_by(post: post)
    like.destroy if like
    redirect_to posts_path
  end

  def index
    @liked_posts = current_user.liked_posts.includes(:user)
  end
end
