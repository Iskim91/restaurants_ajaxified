class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(params.require(:dose).permit(:amount, :ingredient_id))
    @dose.cocktail = @cocktail
    if @dose.save
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'cocktails/show' }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      respond_to do |format|
        format.html { redirect_to cocktail_path(@cocktail) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'cocktails/show' }
        format.js  # <-- idem
      end
    end
  end
end
