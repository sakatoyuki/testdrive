class Car < ApplicationRecord
  validates :name, presence: true
  validates :count, presence: true
  validates :car_image, presence: true

  has_many :stocks
  belongs_to :dealer
  mount_uploader :car_image, ImageUploader
end
