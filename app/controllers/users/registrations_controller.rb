class Users::RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!, only: [:edit, :update]

  protected
  
  def after_sign_up_path_for(resource)
    user_profile_path # プロフィールページへリダイレクト
  end

  # プロフィール編集後のリダイレクト先を変更
  def after_update_path_for(resource)
    user_profile_path # プロフィールページへリダイレクト
  end

  private

  # Devise のストロングパラメータを拡張
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :genre, :experience, :profile_image)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :genre, :experience, :profile_image, :current_password)
  end

end
