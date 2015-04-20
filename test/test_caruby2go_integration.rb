require 'minitest/autorun'
require './lib/caruby2go'
require 'spy/integration'

class TestCaruby2goIngegration < Minitest::Test
  def setup
    @caruby2go = Caruby2go.new(ENV['CONSUMER_KEY'], 'minneapolis')
  end

  def test_get_vehicles
    vehicles_json = @caruby2go.vehicles
    refute vehicles_json.first['address'].empty?
  end

  def test_get_locations
    locations_json = @caruby2go.locations
    refute locations_json.first['locationName'].empty?
  end

  def test_get_parkingspots
    parkingspots_json = @caruby2go.parkingspots
    refute parkingspots_json.first['coordinates'].empty?
  end

  def test_get_gasstations
    @caruby2go = Caruby2go.new(ENV['CONSUMER_KEY'], 'kobenhavn')
    gasstations_json = @caruby2go.gasstations
    refute gasstations_json.first['coordinates'].empty?
  end

  # run when you need to validate cities/payloads
  # this test is pretty slow, comparitively
  def test_validate_cities
    skip('this is a helper method for validating location names')
    # ignored cities are ones for which I don't know the location code
    # that the API accepts
    ignored_cities = %w(chongqing koln cologne dusseldorf eugene honolulu
                        milan southbay)
    cities = %w(amsterdam austin berlin calgary columbus denver firenze
                frankfurt hamburg kobenhavn losangeles miami montreal muenchen
                newyorkcity portland rheinland roma sandiego seattle stockholm
                stuttgart torino toronto twincities vancouver washingtondc
                wien)

    cities.each do |city|
      @caruby2go = Caruby2go.new(ENV['CONSUMER_KEY'], city)
      puts "#{city}"
      payload = @caruby2go.gasstations
      puts "#{city}:\n#{payload}"
    end
    puts "Done with valid cities (#{cities.size})"
    puts 'Did not look for the following cities as they have previously failed validation:'
    ignored_cities.each do |city|
      puts city
    end
  end
end
