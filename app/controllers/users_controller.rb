class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :show]
  
  def index
    @users = User.order(id: :desc).page(params[:page]).per(12)
  end

  def show
    @user = User.find(params[:id]) 
    
    #いいね！したレシピを表示
    likes = Like.where(user_id: current_user.id).pluck(:recipe_id) #ログイン中のユーザーのいいね！のrecipe_idカラムを取得
    @like_list = Recipe.find(likes) #likesテーブルからいいね！済みのレコードを取得
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
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
      flash[:success] = 'プロフィールは正常に更新されました！'
      redirect_to @user
    else
      flash.now[:danger] = 'プロフィールを更新できませんでした。'
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :image, :password, :password_confirmation, :profile)
  end
end
