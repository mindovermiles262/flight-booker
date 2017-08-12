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

    it 'limits name length' do
      @passenger.name = 'a' * 56
      expect(@passenger).to be_invalid
    end

    it 'limits email length' do
      @passenger.email = 'a' * 249 + "@ad.com"
      expect(@passenger).to be_invalid
    end

    it 'filters invalid email addresses' do
      invalids = %w[foo@example,com ad_at_ad.com foo@bar.baz@foo.com foo@bar..com]
      invalids.each do |address|
        @passenger.email = address
        expect(@passenger).to be_invalid
      end
    end
  end
end
