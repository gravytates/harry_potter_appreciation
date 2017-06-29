class Character < ApplicationRecord
  validates :name, :location, :rating, presence: true
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy

  scope :alphabetical, -> { order(name: :asc) }
  scope :creation, -> { order(created_at: :desc) }

  scope :most_reviews, -> {(
    select('characters.name, characters.location, characters.id, count(reviews.id) as reviews_count')
    .joins(:reviews)
    .group("characters.id")
    .order('reviews_count DESC')
    )}


  def average_rating
    # binding.pry
    # @character = Character.find(params[:id])
    total = 0
    self.ratings.each do |rating|
      total += rating.rating
    end
    total / self.ratings.length
  end
end
