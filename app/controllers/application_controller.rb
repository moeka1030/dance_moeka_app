class ApplicationController < ActionController::Base
  include SessionsHelper #コントローラーで使用できるように
  helper_method :logged_in?, :current_user
end
