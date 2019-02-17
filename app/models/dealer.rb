class Dealer < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :login_id, presence: true, uniqueness: true

  has_many :stations
  has_many :cars
end
