class Recipe < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :user
  has_many   :memos
  has_one_attached :image



 with_options presence: true do
  validates :title
  validates :image
  validates :genre_id, numericality: { other_than: 1 }
  validates :url, format: /\A#{URI::regexp(%w(http https))}\z/
 end
end
