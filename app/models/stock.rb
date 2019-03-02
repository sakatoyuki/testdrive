class Stock < ApplicationRecord
  validates :date, presence: true
  validates :time, presence: true
  validates :availables, presence: true

  belongs_to :car
end
