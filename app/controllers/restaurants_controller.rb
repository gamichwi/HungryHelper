class RestaurantsController < ApplicationController
require 'httparty'
  def find
    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyAGQ6cQ8nTlmwHb8zxc3is44Tu_cTOrUxA")
    # GOOGLE_API_SERVER_KEY AIzaSyAGQ6cQ8nTlmwHb8zxc3is44Tu_cTOrUxA
    puts response
  end
end
