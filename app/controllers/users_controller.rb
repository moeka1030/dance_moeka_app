class UsersController < ApplicationController
  #signupについて
  before_action :set_user, only: [:edit, :update]
  before_action :authenticate_user!
  def new
    @user = User.new #空のユーザインスタンス
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:info] = 'success!'
      redirect_to @user, notice: "Account created successfully!"
    else
      flash[:danger] = 'not'
      render 'new', status: :unprocessable_entity
    end
  end

  #profileページについて
  def show
    if params[:id] == "current"
      @user = current_user
    else
      @user = User.find(params[:id])
    end
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to user_path("current"), notice: "プロフィールを更新しました！"
    else
      render :edit
    end
  end


  private
  def set_user
    @user = User.find(params[:id]) #ユーザインスタンス（データ）の取得
    unless user == current_user
      redirect_to user_path("current"), alert: "他のユーザーのプロフィールは編集できません"
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :genre, :experience, :profile_image)
  end
end
