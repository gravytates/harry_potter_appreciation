class Rating < ApplicationRecord
  validates :rating, presence: true
  belongs_to :character
end
