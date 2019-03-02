class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :tel, presence: true
  validates :postalcode, presence: true
  validates :address, presence: true
  validates :current_maker, presence: true
  validates :current_car, presence: true
  validates :status, presence: true
  validates :candidate, presence: true

  has_many :reservations 

end
