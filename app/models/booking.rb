class Booking < ApplicationRecord
  validates :flight, presence: true
  validates :passenger, presence: true
  
  belongs_to :passenger
  belongs_to :flight
end
