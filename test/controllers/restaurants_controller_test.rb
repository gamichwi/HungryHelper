require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  test "should get find" do
    get restaurants_find_url
    assert_response :success
  end

end
