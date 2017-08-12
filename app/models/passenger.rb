class Passenger < ApplicationRecord
  validates :name,  presence: true
  validates :email, presence: true

  belongs_to :booking, optional: true
  has_one :flight, through: :booking
end
