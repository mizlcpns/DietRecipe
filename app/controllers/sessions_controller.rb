class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase
    password = params[:session][:password]
    if login(email, password)
      flash[:success] = "ログインしました！"
      redirect_to @user
    else
      flash.now[:danger] = "ログインできませんでした。"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
  
  private
  
  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password)
      #ログインに成功した時
      session[:user_id] = @user.id
      return true
    else
      #ログインに失敗した時
      return false
    end
  end
end
