require 'rails_helper'

RSpec.describe Booking, type: :model do
  before do
    flight = FactoryGirl.create(:flight)
    passenger = FactoryGirl.create(:passenger)
    @booking = Booking.create(flight: flight, passenger: passenger)
  end

  it { should belong_to :passenger }
  it { should belong_to :flight }

  it 'has valid setup' do
    expect(@booking).to be_valid
  end

  it 'is invalid without a flight' do
    @booking.flight = nil
    expect(@booking).to be_invalid
  end

  it 'is invalid without a passenger' do
    @booking.passenger = nil
    expect(@booking).to be_invalid
  end
end
