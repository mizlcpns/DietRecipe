class ApplicationController < ActionController::Base
  
  include SessionsHelper
  # SessionsHelperに定義していた logged_in?メソッドを使用できるようにする
  
  private
  
  def require_user_logged_in
    unless logged_in?
      redirect_to login_url
    end
  end
end
