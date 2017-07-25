class Airport < ApplicationRecord
  before_save :upcase_code
  validates :code,  presence: true, 
                    length: { is: 3 },
                    format: { with: /\A[a-zA-Z]{3}\z/ }

  private

  def upcase_code
    self.code = code.upcase
  end
end
