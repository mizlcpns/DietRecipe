class Recipe < ApplicationRecord
  mount_uploader :recipe_image, RecipeImageUploader #gem'carrierwave'でrecipe_imageの表示が可能
  belongs_to :user
  has_many :likes, dependent: :destroy
  
  validates :menu, presence: true, length: { maximum: 20 } 
  validates :p, presence: true, numericality: true
  validates :f, presence: true, numericality: true
  validates :c, presence: true, numericality: true
  validates :content, presence: true, length: { maximum: 500 } 
  validates :recipe_image, presence: true
end
