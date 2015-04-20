require 'caruby2go/version'
require 'open-uri'
require 'json'

class Caruby2go
  CAR2GO_URI = 'https://www.car2go.com/api/v2.1'

  def initialize(consumer_key,location=nil)
    @consumer_key = consumer_key
    @location = location
  end

  def get_gasstations # placemarks
    issue_get(build_uri('gasstations'))
  end

  def get_locations # location
    issue_get(build_uri('locations'), 'location')
  end

  def get_parkingspots # placemarks
    issue_get(build_uri('parkingspots'))
  end

  def get_vehicles # placemarks
    issue_get(build_uri('vehicles'))
  end

  private

  def build_uri(endpoint)
    loc_part = @location ? "loc=#{@location}" : nil
    "#{CAR2GO_URI}/#{endpoint}?#{loc_part}&oauth_consumer_key=#{@consumer_key}&format=json"
  end

  def issue_get(uri, json_header='placemarks')
    data = open(uri).read
    JSON.parse(data)[json_header]
  end
end
