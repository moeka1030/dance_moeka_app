class ApplicationController < ActionController::Base
  before_action :authenticate_user!, #devise使用
  unless: -> { controller_name == "static_pages" && action_name == "home" }  #home のときは authenticate_user! を適用しない
end

