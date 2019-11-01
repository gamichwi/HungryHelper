class RestaurantsController < ApplicationController

  def find
    lat = params['latitude']
    lng = params['longtitude']
    res = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=1500&type=restaurant,open_now&key=AIzaSyAGQ6cQ8nTlmwHb8zxc3is44Tu_cTOrUxA")


    case response.code
    when 200
      puts "All good!"
    when 404
      puts "Not found!"
    when 500...600
      puts "ERROR #{response.code}"
    when 403
      puts "not enough quota for pictures lmao"
    end

    #generate random number to select restaurant
    rdm = rand(0..(res['results'].count - 1))

    # photo = HTTParty.get("https://maps.googleapis.com/maps/api/place/photo?maxwidth=#{width}&photoreference=#{photo_reference}&key=AIzaSyAGQ6cQ8nTlmwHb8zxc3is44Tu_cTOrUxA")

    #Restaurant details
    @@restaurant_name = res['results'][rdm]['name']
    @@restaurant_address = res['results'][rdm]['vicinity']
    @@restaurant_rating = res['results'][rdm]['rating']
    @@restaurant_place_id = res['results'][rdm]['place_id']
    # byebug
    #Photo details
    @@width = res['results'][rdm]['photos'][0]['width']
    @@html_attributions = res['results'][rdm]['photos'][0]['html_attributions'] #this looks broken - fix it.
    @@height = res['results'][rdm]['photos'][0]['height']
    @@photo_reference = res['results'][rdm]['photos'][0]['photo_reference']

   byebug
    redirect_to restaurants_show_path
  end

  def show
    render 'show', locals: {restaurant_name: @@restaurant_name, restaurant_address: @@restaurant_address, restaurant_rating: @@restaurant_rating, photo_reference: @@photo_reference}
  end

end
