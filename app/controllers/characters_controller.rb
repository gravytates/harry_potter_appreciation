class CharactersController < ApplicationController
  def index
    @characters = Character.where(nil)
    @characters = @characters.alphabetical if request.original_fullpath == "/characters.name"
    @characters = @characters.creation if request.original_fullpath == "/characters.created_at"
    @characters = @characters.most_reviews if request.original_fullpath == "/characters.reviews"
  end

  def show
    @character = Character.find(params[:id])
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.new(character_params)
    if @character.save
    flash[:notice] = "Character successfully added!"
      redirect_to  characters_path
    else
      render :new
    end
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character= Character.find(params[:id])
    if @character.update(character_params)
      flash[:notice] = "Character successfully updated!"
      redirect_to character_path(@character)
    else
      render :edit
    end
  end

  def destroy
    @character = Character.find(params[:id])
    if @character.destroy
      flash[:notice] = "Character successfully removed!"
      redirect_to characters_path
    end
  end

private
  def character_params
    params.require(:character).permit(:name, :location, :rating)
  end
end
