class Car < ApplicationRecord
  validates :name, presence: true
  validates :count, presence: true
  validates :car_image, presence: true
  validates :dealer_id, presence: true

  has_many :stocks
  belongs_to :dealers
end
