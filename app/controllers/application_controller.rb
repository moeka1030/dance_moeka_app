
class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: -> { controller_name == "static_pages" && action_name == "home" }  #home のときは authenticate_user! を適用しない

  # ログイン後のリダイレクト先を指定
  def after_sign_in_path_for(resource)
    post_index  # ログイン後に投稿一覧へ遷移
  end
end

