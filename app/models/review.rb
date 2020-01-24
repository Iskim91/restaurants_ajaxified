class Review < ApplicationRecord
  belongs_to :cocktail
  belongs_to :user
  RATINGS = (1..5).to_a
  validates :comment, length: { minimum: 10 }
  validates :comment, :rating, presence: true
end
