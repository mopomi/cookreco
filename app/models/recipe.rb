class Recipe < ApplicationRecord

  validates :title, presence: true do
  validates :genre_id  presence: true do
  validates :image

  belongs_to :user
  has_many   :momes
  has_one_attached :image
end
