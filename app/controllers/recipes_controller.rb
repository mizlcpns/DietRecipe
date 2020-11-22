class RecipesController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def index
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)
    
    if @recipe.save
      flash[:success] = "レシピを投稿しました！"
      redirect_to recipe_path(@recipe)
    else
      flash[:danger] = "レシピを投稿できませんでした。"
      render new_recipe_path
    end
  end

  def destroy
    @recipe.destroy
    flash[:success] = 'レシピを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def recipe_params
    params.require(:recipe).permit(:menu, :p, :f, :c, :content, :recipe_image)
  end
  
  def correct_user
    @recipe = current_user.recipes.find_by(id: params[:id])
    
    unless @recipe
      redirect_to user_path
    end
  end
end
