require 'test_helper'

class AirportTest < ActiveSupport::TestCase

  def setup
    @airport = Airport.create(code: "ALD", name: "Duss International Airport")
  end

  test "the setup" do
    assert @airport.valid?
  end

  test "Airport codes are length 3" do 
    @airport.code = "AA"
    assert_not @airport.valid?
    @airport.code = "AAAA"
    assert_not @airport.valid?
    @airport.code = "AAA"
    assert @airport.valid?
  end

  test "Airports have names" do
    @airport.name = "  "
    assert_not @airport.valid?
  end

  test "Airport codes are letters only" do
    @airport.code = "R2D"
    assert_not @airport.valid?
  end

  test "Airport codes are saved UPCASE" do
    mixed_case = "aAa"
    @airport.code = mixed_case
    @airport.save
    assert_equal mixed_case.upcase, @airport.reload.code
  end
end
