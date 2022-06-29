class RecipesController < ApplicationController

  def index
    if params[:query].present?
      @recipes = Recipe.where("name LIKE ?", "%#{params[:query]}%")
    else
      @recipes = Recipe.created_at
    end
  end
  def show
    @recipe = Recipe.find(params[:id])
  end
  def edit
    @recipe = Recipe.find(params[:id])
  end
  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params)
    redirect_to @recipe
  end
  def new
    @recipe = Recipe.new
  end
  def create
    @recipe = Recipe.new(post_params)
    @recipe.save
    redirect_to @recipe
  end
  def post_params
    params.require(:recipe).permit(:name, :stuff, :calories, :prepare_mode, :kind, :portion, :duration, :poster)
  end
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url
  end
  def busca
    nome = params[:name]
    @recipes = Recipe.where "name like ?", "#{@nome}"
  end
  private

  def recipe_params
    params.require(:recipe).permit(:name, :stuff, :calories, :prepare_mode, :kind, :portion, :duration, :poster)
  end

end
