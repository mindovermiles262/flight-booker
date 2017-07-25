class Airport < ApplicationRecord
  before_save :upcase_code
  validates :code,  presence: true, 
                    length: { is: 3 },
                    format: { with: /\A[a-zA-Z]{3}\z/ }
  has_many :departures, foreign_key: :departure_airport, class_name: "Flight"
  has_many :arrivals,   foreign_key: :arrival_airport,   class_name: "Flight"
  private

  def upcase_code
    self.code = code.upcase
  end
end
