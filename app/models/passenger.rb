class Passenger < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true

  belongs_to :bookings
  has_many :flights, through: :bookings
end
