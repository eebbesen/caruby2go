require 'caruby2go/version'
require 'invalid_location_error'
require 'open-uri'
require 'json'

##
# Wraps the Car2Go public API
class Caruby2go
  CAR2GO_URI = 'https://www.car2go.com/api/v2.1'

  def initialize(consumer_key, location = nil, uri=CAR2GO_URI)
    @consumer_key = consumer_key
    @location = location
    @uri = uri
  end

  def gasstations # placemarks
    issue_get(build_uri('gasstations'))
  end

  def locations # location
    issue_get(build_uri('locations'), 'location')
  end

  def parkingspots # placemarks
    issue_get(build_uri('parkingspots'))
  end

  def vehicles # placemarks
    issue_get(build_uri('vehicles'))
  end

  private

  def build_uri(endpoint)
    loc_part = @location ? "&loc=#{@location}" : nil
    "#{@uri}/#{endpoint}?oauth_consumer_key=#{@consumer_key}#{loc_part}&format=json"
  end

  def issue_get(uri, json_header = 'placemarks')
    data = open(uri).read
    JSON.parse(data)[json_header]
  rescue OpenURI::HTTPError => e
    raise InvalidLocationError.new(@location) if '400 Bad Request' == e.message
    raise e
  end

  def uri
    @uri
  end
end
