class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true

  has_many :recipes
  has_many :memos
  has_many :likes, dependent: :destroy
  has_many :like_recipes, through: :likes, source: :recipe
end
