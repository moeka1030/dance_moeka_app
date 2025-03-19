class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:create, :destroy]

  def create
    post = Post.find(params[:post_id])
    current_user.likes.create(post: post)
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js #いいねの非同期処理（リロードなしの更新）を可能に
    end
  end

  def destroy
    like = current_user.likes.find(params[:id])
    like.destroy if like
    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.js 
    end
  end

  def index
    @liked_posts = Post.joins(:likes).where(likes: { user_id: current_user.id }).distinct
    # currentユーザがいいねしたデータのみの取得に限定
  end

  

  private

  def set_post
    @post = Post.find(params[:post_id])
  rescue ActiveRecord::RecordNotFound #RecordNotFound＝投稿が見つからない、場合に一覧ページに戻す
    redirect_back fallback_location: post_index_path, alert: "投稿が見つかりません"
  end
end
