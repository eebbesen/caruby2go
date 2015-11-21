require 'minitest/autorun'
require './lib/invalid_location_error'

class TestInvalidLocationError < Minitest::Test
  def test_initialize
    ile = InvalidLocationError.new('nowheresville')
    assert_equal "Car2Go probably doesn't like the city you entered: nowheresville", ile.message
  end
end
