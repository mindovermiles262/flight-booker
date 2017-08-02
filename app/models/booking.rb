class Booking < ApplicationRecord
  belongs_to :passenger
  belongs_to :flight

  validates :flight, presence: true
  validates :passenger, presence: true
end
