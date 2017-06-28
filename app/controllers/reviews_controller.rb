class ReviewsController < ApplicationController
  def new
    @character = Character.find(params[:character_id])
    @review = Review.new
  end

  def create
    @character = Character.find(params[:character_id])
    @review = @character.reviews.new(reviews_params)
    if @review.save
      redirect_to character_path(@character)
    else
      render :new
    end
  end

  private
    def reviews_params
      output = params.require(:review).permit(:author, :body)
    end

end
