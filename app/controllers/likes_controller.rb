class LikesController < ApplicationController
  before_action :require_user_logged_in
  
  def create
    @like = current_user.likes.create(recipe_id: params[:recipe_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @like = current_user.likes.find_by(recipe_id: @recipe.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
