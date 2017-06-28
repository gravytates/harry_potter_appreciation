class Character < ApplicationRecord
  validates :name, :location, :rating, presence: true

  scope :alphabetical, -> (name) { order(name: :asc) }
  scope :creation, -> (created_at) { order(created_at: :desc) }
end
