class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @city = City.find(params[:city_id])
  end

  def create
    city = City.find(params[:city_id])
    restaurant = city.restaurants.create!(restaurant_params)
    redirect_to "/cities/#{restaurant.city_id}/restaurants"
  end

  private
  def restaurant_params
    params.permit(:name, :food_type, :alcohol_served, :rating)
  end
end