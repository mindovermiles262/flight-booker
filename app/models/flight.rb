class Flight < ApplicationRecord
  validates :departure,       presence: true
  validates :arrival,         presence: true
  validates :departure_time,  presence: true
  validates_associated :airports

  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"

end
