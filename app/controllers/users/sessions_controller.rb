class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for(resource)
    post_index_path
  end

  def after_sign_out_path_for(resource_or_scope) #ログアウト後はresourceが削除されているためscope使用
    root_path 
  end
end
