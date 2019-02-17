class Stock < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :availables, presence: true
  validates :car_id, presence: true

  belongs_to :cars
end
