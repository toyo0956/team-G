class Item < ApplicationRecord
  has_many_attached :images
  validates :name, :description, :category, :condition, :feepayer, :method, :region, :days, :price, presence: true

  belongs_to :user
  
  validate :images_validate
  validate :image_max_length
  def images_validate
    unless images.attached?
      errors.add(:images, '画像を入れてください')
    end
  end

  def image_max_length
    unless images.length <= 10
      errors.add(:images, '画像を10枚以内にしてください')
    end
  end
end
