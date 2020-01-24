class ReviewsController < ApplicationController
  def create
    @review = Review.new(params.require(:review).permit(:rating, :comment))
    @cocktail = Cocktail.find(params[:cocktail_id])
    @review.cocktail = @cocktail
    @review.user = current_user
    if @review.save
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'cocktail/show' }
        format.js
      end
    end
  end
end
