class Booking < ApplicationRecord
  validates :flight, presence: true
  validates :passenger, presence: true
  
  has_many :passenger
  belongs_to :flight
  accepts_nested_attributes_for :passenger
end
