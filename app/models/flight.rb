class Flight < ApplicationRecord
  validates :departure,       presence: true
  validates :arrival,         presence: true
  validates :departure_time,  presence: true

  belongs_to :departure, class_name: "Airport"
  belongs_to :arrival, class_name: "Airport"
  has_many :bookings

  def self.departure_list
    select(:departure_id).distinct
  end

  def self.arrival_list
    select(:arrival_id).distinct
  end

  def self.date_list
    date = Flight.all.order(departure_time: :asc)
    date.map { |f| f.departure_time.strftime("%b %d %Y") }.uniq
  end

  def self.lookup(departure, arrival, day)
    Flight.where(departure_id: departure,
                 arrival_id: arrival,
                 departure_time: day_range(day))
  end

  private

  def self.day_range(date)
    unless date.nil?
      date = date.to_date
      date.beginning_of_day..date.end_of_day
    end
  end

end
