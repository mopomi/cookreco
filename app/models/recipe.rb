class Recipe < ApplicationRecord

 with_options presence: true do
  validates :title
  validates :genre_id
  validates :image
 end


  belongs_to :user
  has_many   :momes
  has_one_attached :image

end
