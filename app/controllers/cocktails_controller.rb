class CocktailsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :cocktail_find, only: [:show, :edit, :destroy, :update]
  def index
    # @cocktails = Cocktail.all
    # if params[:keyword].present?
      # @cocktails = Cocktail.where("name ILIKE ?", "%#{params[:keyword]}")
    # else
      @cocktails = Cocktail.all
    # end
  end

  def show
    @dose = Dose.new
    @review = Review.new
    @user = @cocktail.user
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(strong_params)
    @cocktail.user = current_user
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cocktail.update(strong_params)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @cocktail.destroy
  end

  private

  def cocktail_find
    @cocktail = Cocktail.find(params[:id])
  end

  def strong_params
    params.require(:cocktail).permit(:name, :photo, :description)
  end
end
