class RestaurantsController < ApplicationController
# require 'httparty'
  def find
    lat = params['latitude']
    lng = params['longtitude']
    res = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{lat},#{lng}&radius=1500&type=restaurant,open_now&key=AIzaSyAGQ6cQ8nTlmwHb8zxc3is44Tu_cTOrUxA")

    #generate random number to select restaurant
    rdm = rand(0..(res.count - 1))
    #make that number stable so it doesn't regen
    rdmstable = rdm


    photo_reference = res['results'][rdmstable]['photos'][0]['photo_reference']
    height = res['results'][rdmstable]['photos'][0]['height']
    width = res['results'][rdmstable]['photos'][0][width]
    html_attributions = res['results'][rdmstable]['photos'][0]['html_attributions']

    photo = HTTParty.get("https://maps.googleapis.com/maps/api/place/photo?maxwidth=#{width}&photoreference=#{photo_reference}&key=AIzaSyAGQ6cQ8nTlmwHb8zxc3is44Tu_cTOrUxA")



    @@restaurant_name = res['results'][rdmstable]['name']
    @@restaurant_address = res['results'][rdmstable]['vicinity']
    @@restaurant_photo = photo



    # byebug
    redirect_to restaurants_show_path, restaurant_name: @@restaurant_name, restaurant_address: @@restaurant_address, restaurant_photo: @@restaurant_photo

    # format.html { render 'restaurants/show', notice: 'A HungryHelper place was successfully created.'}

  end

  def show
    render 'show', locals: {restaurant_name: @@restaurant_name, restaurant_address: @@restaurant_address, restaurant_photo: @@restaurant_photo}
  end

end
