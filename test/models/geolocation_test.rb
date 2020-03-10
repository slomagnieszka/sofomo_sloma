require 'test_helper'

class GeolocationTest < ActiveSupport::TestCase
  setup do
    @geolocation = geolocations(:two)
  end

  test "should not save without ip" do
    geolocation = Geolocation.new
    assert_not geolocation.save, true
  end

  test "should not save with validation" do
    geolocation = Geolocation.new(ip: @geolocation.ip, ip_type: @geolocation.ip_type, latitude: @geolocation.latitude, longitude: @geolocation.longitude)
    assert geolocation.save, true
  end
end
