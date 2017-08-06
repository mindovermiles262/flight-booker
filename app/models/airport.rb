class Airport < ApplicationRecord
  validates :name, presence: true
  validates :code,  length: { is: 3 }, 
                    uniqueness: true,
                    format: {  with: /\A[a-zA-Z]{3}\z/}
  before_save :upcase_code

  has_many :departures, class_name: "Flight", foreign_key: "departure_id"
  has_many :arrivals,   class_name: "Flight", foreign_key: "arrival_id"

  private

  def upcase_code
    self.code = code.upcase
  end
end
