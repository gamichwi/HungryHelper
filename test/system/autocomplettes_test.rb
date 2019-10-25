require "application_system_test_case"

class AutocomplettesTest < ApplicationSystemTestCase
  setup do
    @autocomplette = autocomplettes(:one)
  end

  test "visiting the index" do
    visit autocomplettes_url
    assert_selector "h1", text: "Autocomplettes"
  end

  test "creating a Autocomplette" do
    visit autocomplettes_url
    click_on "New Autocomplette"

    fill_in "Address", with: @autocomplette.address
    fill_in "Administrative area level 1", with: @autocomplette.administrative_area_level_1
    fill_in "Country", with: @autocomplette.country
    fill_in "Locality", with: @autocomplette.locality
    fill_in "Postal code", with: @autocomplette.postal_code
    fill_in "Route", with: @autocomplette.route
    fill_in "Street number", with: @autocomplette.street_number
    click_on "Create Autocomplette"

    assert_text "Autocomplette was successfully created"
    click_on "Back"
  end

  test "updating a Autocomplette" do
    visit autocomplettes_url
    click_on "Edit", match: :first

    fill_in "Address", with: @autocomplette.address
    fill_in "Administrative area level 1", with: @autocomplette.administrative_area_level_1
    fill_in "Country", with: @autocomplette.country
    fill_in "Locality", with: @autocomplette.locality
    fill_in "Postal code", with: @autocomplette.postal_code
    fill_in "Route", with: @autocomplette.route
    fill_in "Street number", with: @autocomplette.street_number
    click_on "Update Autocomplette"

    assert_text "Autocomplette was successfully updated"
    click_on "Back"
  end

  test "destroying a Autocomplette" do
    visit autocomplettes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Autocomplette was successfully destroyed"
  end
end
