require 'rails_helper'

RSpec.describe Airport, type: :model do
  before do
    @airport = FactoryGirl.create(:airport)
  end

  it { should have_many(:departures).class_name("Flight") }
  it { should have_many(:arrivals).class_name("Flight") }

  it "is valid with a name and 3-letter code" do
    expect(@airport).to be_valid
  end
  it "is invalid without a name" do
    @airport.name = ' '
    expect(@airport).to be_invalid
  end
  it "is invalid with a 2-letter code" do
    @airport.code = "AA"
    expect(@airport).to be_invalid
  end
  it "is invalid with a 4-letter code" do
    @airport.code = "AAAA"
    expect(@airport).to be_invalid
  end
  it "is invalid with a numeral code" do
    @airport.code = "A1A"
    expect(@airport).to be_invalid
  end
  it "is invalid with duplicate code" do
    duplicate = Airport.new( name: "Duplicate Airport", code: @airport.code)
    expect(duplicate).to be_invalid
  end
  it "saves as upcase" do
    @duplicate = Airport.create( name: "Duplicate Airport", code: "dup")
    expect(@duplicate.code).to eq("DUP")
  end
end