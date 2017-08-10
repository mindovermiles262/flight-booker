class Booking < ApplicationRecord
  validates :flight, presence: true
  validates :passengers, presence: true
  
  has_many :passengers
  belongs_to :flight
  accepts_nested_attributes_for :passengers
end
