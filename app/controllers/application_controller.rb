class ApplicationController < ActionController::Base
  include SessionsHelper #コントローラーで使用できるように
  helper_method :current_user, :logged_in?
  # before_action :authenticate_user! 
  
  private

  def authenticate_user
    unless logged_in?
      flash[:alert] = 'ログインをしてください'
      redirect_to login_path
    end
  end

  


end
