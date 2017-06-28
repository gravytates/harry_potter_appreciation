class Review < ApplicationRecord
  validates :author, :body, presence: true
  belongs_to :character
end
