class Users::SessionsController < Devise::SessionsController
  protected

  # ログイン後のリダイレクト先をカスタマイズ
  def after_sign_in_path_for(resource)
    post_index # 投稿一覧ページへリダイレクト
  end

  # ログアウト後のリダイレクト先をカスタマイズ
  def after_sign_out_path_for(resource_or_scope)
    post_index # ログアウト後はトップページへ
  end
end
