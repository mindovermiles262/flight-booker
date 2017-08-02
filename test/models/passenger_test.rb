require 'test_helper'

class PassengerTest < ActiveSupport::TestCase

  def setup
    @passenger = passengers(:one)
  end

  test 'the setup' do
    assert @passenger.valid?
  end

  test 'passenger name is present' do
    @passenger.name = "  "
    assert_not @passenger.valid?
  end

  test 'passenger email is present' do
    @passenger.email = " "
    assert_not @passenger.valid?
  end
end
