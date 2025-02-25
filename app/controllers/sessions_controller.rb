class SessionsController < ApplicationController
  #login/logoutについて
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
  
    if user&.valid_password?(params[:password])  # 🔥 Devise の `valid_password?` を使用
      session[:user_id] = user.id
      redirect_to posts_path, notice: 'ログインしました'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが間違っています'
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "ログアウトしました！"
  end
end
