require 'minitest/autorun'
require './lib/caruby2go'
# require 'pry'
require 'spy/integration'

class TestCaruby2goIngegration < Minitest::Test
  def setup
    @caruby2go = Caruby2go.new(ENV['CUSTOMER_KEY'], 'minneapolis')
  end

  def test_get_vehicles
    vehicles_json = @caruby2go.get_vehicles
  end

  def test_get_locations
    locations_json = @caruby2go.get_locations
  end

  def test_get_parkingspots
    parkingspots_json = @caruby2go.get_parkingspots
  end

  def test_get_gasstations
    gasstations_json = @caruby2go.get_gasstations
  end
end
