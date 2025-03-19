class Users::RegistrationsController < Devise::RegistrationsController #deviseに標準搭載のアクションのカスタマイズ
  protected #メソッドの使用をクラスの内部、または、継承したクラスに限定

  def after_sign_up_path_for(resource) #resource=クラスのインスタンス
    post_index_path 
  end

  def update_resource(resource, params) 
    params = params.to_h #ハッシュ化してdeleteを使用可に
    params.delete(:current_password) 
    resource.update_without_password(params)
  end

  def after_update_path_for(resource)
    user_profile_path 
  end

  private
  # 許可するパラメーター（paramsーフォームやURLからサーバーに送られる情報）の指定
  def sign_up_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :genre, :experience, :profile_image)
  end

  def account_update_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :age, :genre, :experience, :profile_image, :current_password)
  end
end
