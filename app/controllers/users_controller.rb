class UsersController < ApplicationController
  #signupについて
  before_action :set_user, only: [:edit, :update]
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
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def edit
    
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールを更新しました'
    else
      render :edit
    end
  end


  private
  def set_user
    @user = User.find(params[:id]) #ユーザインスタンス（データ）の取得
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :genre, :experience, :profile_image)
  end
end
