class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.where("alcohol_served = true")
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

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    restaurant = Restaurant.find(params[:id])
    restaurant.update(restaurant_params)
    redirect_to "/restaurants/#{restaurant.id}"
  end

  def destroy
    Restaurant.destroy(params[:id])
    redirect_to "/restaurants"
  end

  private
  def restaurant_params
    params.permit(:name, :food_type, :alcohol_served, :rating)
  end
end