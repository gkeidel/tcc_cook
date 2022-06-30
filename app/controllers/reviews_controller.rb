class ReviewsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @recipe = Recipe.find(params[:recipe_id])
    @review.recipe = @recipe
    @review.save
    redirect_to recipe_path(@review.recipe)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to recipe_path(@review.recipe)
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
