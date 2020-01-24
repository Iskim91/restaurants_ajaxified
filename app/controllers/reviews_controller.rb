class ReviewsController < ApplicationController
  def create
    @review = Review.new(params.require(:review).permit(:rating, :comment))
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.user = current_user
    if @review.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktail/show'
    end
  end
end
