class CitiesController < ApplicationController
  
  def index
    @cities = City.all
  end

  def show
    @city = City.find(params[:id])
  end

  def city_restaurant_index
    @city_restaurants = show.restaurants
  end
end