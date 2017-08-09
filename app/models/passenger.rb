class Passenger < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true

  has_one :booking
  has_one :flight, through: :booking
end
