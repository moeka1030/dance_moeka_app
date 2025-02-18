class UsersController < ApplicationController
  #signupについて
  def new
    @user = User.new #空のユーザインスタンス
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:info] = 'success!'
      redirect_to root_path, notice: "Account created successfully!"
    else
      flash[:danger] = 'not'
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
