require 'test_helper'

class AutocomplettesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @autocomplette = autocomplettes(:one)
  end

  test "should get index" do
    get autocomplettes_url
    assert_response :success
  end

  test "should get new" do
    get new_autocomplette_url
    assert_response :success
  end

  test "should create autocomplette" do
    assert_difference('Autocomplette.count') do
      post autocomplettes_url, params: { autocomplette: { address: @autocomplette.address, administrative_area_level_1: @autocomplette.administrative_area_level_1, country: @autocomplette.country, locality: @autocomplette.locality, postal_code: @autocomplette.postal_code, route: @autocomplette.route, street_number: @autocomplette.street_number } }
    end

    assert_redirected_to autocomplette_url(Autocomplette.last)
  end

  test "should show autocomplette" do
    get autocomplette_url(@autocomplette)
    assert_response :success
  end

  test "should get edit" do
    get edit_autocomplette_url(@autocomplette)
    assert_response :success
  end

  test "should update autocomplette" do
    patch autocomplette_url(@autocomplette), params: { autocomplette: { address: @autocomplette.address, administrative_area_level_1: @autocomplette.administrative_area_level_1, country: @autocomplette.country, locality: @autocomplette.locality, postal_code: @autocomplette.postal_code, route: @autocomplette.route, street_number: @autocomplette.street_number } }
    assert_redirected_to autocomplette_url(@autocomplette)
  end

  test "should destroy autocomplette" do
    assert_difference('Autocomplette.count', -1) do
      delete autocomplette_url(@autocomplette)
    end

    assert_redirected_to autocomplettes_url
  end
end
