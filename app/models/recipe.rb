class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_many   :memos, dependent: :destroy
  has_one_attached :image

 with_options presence: true do
  validates :title
  validates :image
  validates :genre_id, numericality: { other_than: 1 }
 end

 def self.search(search)
  if search != ""
    Recipe.where('title LIKE(?)', "%#{search}%")
  else
    Recipe.all
  end
 end
end
