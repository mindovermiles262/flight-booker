require 'rails_helper'

RSpec.describe Flight, type: :model do
  before do
    @flight = FactoryGirl.create(:flight)
  end

  it { should belong_to(:departure).class_name("Airport") }
  it { should belong_to(:arrival).class_name("Airport") }
  it { should have_many :bookings }

  context 'model validations' do
    it "has valid factory" do
      expect(@flight).to be_valid
    end

    it "is invalid with no departure" do
      @flight.departure = nil
      expect(@flight).to be_invalid
    end

    it "is invalid with no arrival" do
      @flight.arrival = nil
      expect(@flight).to be_invalid
    end

    it "is invalid with no departure time" do
      @flight.departure_time = ''
      expect(@flight).to be_invalid
    end
  end

  context 'model methods' do
    it 'formats date_list' do
      expect(Flight.date_list).to be_an(Array)
      expect(Flight.date_list[0]).to eq("Aug 04 2017")
    end

    it 'formats departure_list' do
      expect(Flight.departure_list).to be_an(ActiveRecord::Relation)
    end

    it 'formats arrival_list' do
      expect(Flight.arrival_list).to be_an(ActiveRecord::Relation)
    end

    it 'formats day_range' do
      day = Time.now.to_date
      expect(Flight.day_range(day)).to be_a(Range)
      expect(Flight.day_range(day)).to eq(day.beginning_of_day..day.end_of_day)
    end

    it 'searches for flights' do
      dep = @flight.departure_id
      arr = @flight.arrival_id
      date = @flight.departure_time.to_date
      lookup = Flight.lookup(dep, arr, date)
      expect(lookup).to be_an(ActiveRecord::Relation)
      expect(lookup[0].arrival_id).to eq(arr)
    end

  end

end
