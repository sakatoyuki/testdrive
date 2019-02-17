class Station < ApplicationRecord
  validates :name, presence: true
  validates :waiting_spot, presence: true
  validates :map_image, presence: true
  validates :dealer_id, presence: true

  belongs_to :dealer

  mount_uploader :map_image, ImageUploader
end
