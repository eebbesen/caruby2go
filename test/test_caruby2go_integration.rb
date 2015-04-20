require 'minitest/autorun'
require './lib/caruby2go'
require 'spy/integration'

class TestCaruby2goIngegration < Minitest::Test
  def setup
    @caruby2go = Caruby2go.new(ENV['CONSUMER_KEY'], 'minneapolis')
  end

  def test_get_vehicles
    vehicles_json = @caruby2go.get_vehicles
    refute vehicles_json.first['address'].empty?
  end

  def test_get_locations
    locations_json = @caruby2go.get_locations
    refute locations_json.first['locationName'].empty?
  end

  def test_get_parkingspots
    parkingspots_json = @caruby2go.get_parkingspots
    refute parkingspots_json.first['coordinates'].empty?
  end

  def test_get_gasstations
    @caruby2go = Caruby2go.new(ENV['CONSUMER_KEY'], 'kobenhavn')
    gasstations_json = @caruby2go.get_gasstations
    refute gasstations_json.first['coordinates'].empty?
  end

#   run when you need to validate cities/payloads
#   def test_validate_cities
#     ignored_cities = ['chongqing', 'koln', 'cologne', 'dusseldorf','eugene','honolulu','milan','southbay','washington']
#     cities = ['amsterdam','austin','berlin','calgary','columbus','denver','firenze','frankfurt','hamburg','kobenhavn','losangeles','miami','montreal','muenchen','newyorkcity','portland','rheinland','roma','sandiego','seattle','stockholm','stuttgart','torino','toronto','twincities','vancouver','washingtondc',
# 'wien']

#     cities.each do |city|
#       @caruby2go = Caruby2go.new(ENV['CONSUMER_KEY'], city)
#       # puts "#{city}"
#       payload = @caruby2go.get_gasstations
#       # puts "#{city}:\n#{payload}"
#     end
#     # puts "done with #{cities.size}"
#   end
end
