module SessionsHelper
  def current_user
    #現在ログインしているユーザーを取得
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  def logged_in?
    !!current_user
  end
end
