class Passenger < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 50 }
  valid_email_address = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*[a-z]+\z/i
  validates :email, presence: true, format: { with: valid_email_address },
                    length: { maximum: 255 }

  belongs_to :booking, optional: true
  has_one :flight, through: :booking

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
