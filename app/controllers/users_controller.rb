class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  before_action :set_user, only: [:show, :edit, :update]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(12)
  end

  def show
    @likes = Like.where(user_id: @user.id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = "ユーザー登録が完了しました！"
      redirect_to @user
    else
      flash.now[:danger] = "ユーザー登録に失敗しました。"
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = 'プロフィールは正常に更新されました！'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールを更新できませんでした。'
      render :edit
    end
  end
  
  private
  
  def set_user #before_actionで共通化
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :profile)
  end
end
