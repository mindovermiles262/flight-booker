class Flight < ApplicationRecord
  validates :departure,       presence: true
  validates :arrival,         presence: true
  validates :departure_time,  presence: true
  validates_associated :airports

  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"

  def self.departure_list
    select(:departure_id).distinct
  end

  def self.arrival_list
    select(:arrival_id).distinct
  end

end
