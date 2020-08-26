require "minitest/autorun"
require "minitest/pride"
require "./lib/house"
require "./lib/room"

class HouseTest < Minitest::Test
  def test_it_exist
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_it_has_a_price
    skip
    house = House.new("$400000", "123 sugar lane")

    assert_equal "$40000", house.price
  end
end
