require 'rails_helper'

RSpec.describe Passenger, type: :model do
  before do
    @passenger = FactoryGirl.build(:passenger)
  end

  context 'model validations' do
    it 'has valid factory' do
      expect(@passenger).to be_valid
    end

    it 'is invalid without a name' do
      @passenger.name = ' '
      expect(@passenger).to be_invalid
    end

    it 'is invalid without an email' do 
      @passenger.email = ''
      expect(@passenger).to be_invalid
    end
  end
end
