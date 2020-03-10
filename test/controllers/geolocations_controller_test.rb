require 'test_helper'

class GeolocationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @geolocation = geolocations(:one)
  end

  test "should get index" do
    get api_v1_geolocations_url, as: :json
    assert_response :success
  end

  test "should create geolocation" do
    assert_difference('Geolocation.count') do
      post api_v1_geolocations_url, params: { ip: @geolocation.ip }, as: :json
    end

    assert_response 201
  end

  test "should show geolocation" do
    get api_v1_geolocations_url(@geolocation), as: :json
    assert_response :success
  end
end
