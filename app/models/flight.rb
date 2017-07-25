class Flight < ApplicationRecord
  validates :departure_airport, presence: true
  validates :arrival_airport,   presence: true
  validates :take_off,          presence: true
  # validates :durration

  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport,   class_name: "Airport"
end
