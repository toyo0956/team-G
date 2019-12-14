class Item < ApplicationRecord
  # mount_uploader :image, ImageUploader
  has_many_attached :images
  validates :name, :description, :category, :condition, :feepayer, :method, :region, :days, :price, presence: true
end
