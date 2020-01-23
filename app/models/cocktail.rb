class Cocktail < ApplicationRecord
  # has_one_attached :photo
  belongs_to :user
  mount_uploader :photo, PhotoUploader
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, presence: true, uniqueness: true
  validates :user, presence: true
end
