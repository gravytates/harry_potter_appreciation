class Character < ApplicationRecord
  validates :name, :location, :rating, presence: true
end
