class RatingsController < ApplicationController
  def new
    @character = Character.find(params[:character_id])
    @rating = Rating.new
  end

  def create
    @character = Character.find(params[:character_id])
    @rating = @character.ratings.new(ratings_params)
    if @rating.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  private
    def ratings_params
      output = params.require(:rating).permit(:rating)
    end

end
