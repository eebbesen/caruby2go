require 'minitest/autorun'
require './lib/caruby2go'
require 'spy/integration'

class TestCaruby2go < Minitest::Test
  def setup
    @caruby2go = Caruby2go.new('testkey', 'MPLS')
  end

  def test_initialize
    assert_equal 'testkey', @caruby2go.instance_variable_get(:@consumer_key)
  end

  def test_build_uri_with_location
    assert_equal 'https://www.car2go.com/api/v2.1/endpt?loc=MPLS&oauth_consumer_key=testkey&format=json',
                 @caruby2go.send(:build_uri, 'endpt')
  end

  def test_build_uri_without_location
    @caruby2go = Caruby2go.new('testkey')
    assert_equal 'https://www.car2go.com/api/v2.1/endpt?&oauth_consumer_key=testkey&format=json',
                 @caruby2go.send(:build_uri, 'endpt')
  end

  def test_get_vehicles
    vehicles_json = '{"placemarks":[{"address":"Grand Ave 1600, 55105 St Paul",
                    "coordinates":[-93.16789,44.93999,0],"engineType":"CE",
                    "exterior":"GOOD","fuel":26,"interior":"GOOD",
                    "name":"AB6860","smartPhoneRequired":false,
                    "vin":"AAAAA0AA0AA000000"},
                    {"address":"West Kellogg Boulevard 15, 55102 St Paul",
                      "coordinates":[-93.093654,44.943895,0],"engineType":"CE",
                      "exterior":"GOOD","fuel":25,"interior":"GOOD",
                      "name":"AB6860","smartPhoneRequired":false,
                      "vin":"AAAAA1AA1AA111111"},
                      {"address":"South 5th Street 350, 55415 Minneapolis",
                        "coordinates":[-93.265769,44.976851,0],
                        "engineType":"CE","exterior":"GOOD","fuel":24,
                        "interior":"GOOD","name":"AB6860",
                        "smartPhoneRequired":false,"vin":"AAAAA2AA2AA222222"}]}'
    run_mock(vehicles_json, :vehicles)
  end

  def test_get_locations
    locations_json = '{"location":[{"countryCode":"DE","defaultLanguage":"de",
                      "locationId":1,"locationName":"Ulm",
                      "mapSection":{"center":{"latitude":48.398917,
                        "longitude":9.99139},
                        "lowerRight":{"latitude":48.3446,"longitude":10.0459},
                        "upperLeft":{"latitude":48.4383,"longitude":9.9146} },
                        "timezone":"Europe/Berlin"}]}'
    run_mock(locations_json, :locations)
  end

  def test_get_parkingspots
    parkingspots_json = '{"placemarks":[{"coordinates":[-97.750983,30.269577,0],
                         "name":"West Ave","totalCapacity":4,"usedCapacity":0,
                         "chargingPole":false},
                         {"coordinates":[-97.74225,30.265976,0],
                          "name":"100 East 4th Street","totalCapacity":4,
                          "usedCapacity":0,"chargingPole":true}]}'
    run_mock(parkingspots_json, :parkingspots)
  end

  def test_get_gasstations
    gasstations_json = '{"placemarks":[{"coordinates":[9.987988,48.358829,0],
                        "name":"Shell, Hauptstrasse 12"},
                        {"coordinates":[9.990183,48.404832,0],
                          "name":"Shell, Karlstrasse 38"}]}'
    run_mock(gasstations_json, :gasstations)
  end

  def run_mock(json, method)
    mock_open_uri = Minitest::Mock.new
    mock_open_uri.expect(:read, json)

    OpenURI.stub :open_uri, mock_open_uri do
      @caruby2go.send(method)
    end

    mock_open_uri.verify
  end
end
