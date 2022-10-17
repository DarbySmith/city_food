class CitiesController < ApplicationController
  
  def index
    @cities = City.all.order(created_at: :desc)
  end

  def show
    @city = City.find(params[:id])
  end

  def city_restaurant_index
    @city_restaurants = show.restaurants
    if params[:sort] == "true"
      @city_restaurants = show.restaurants.order(:name)
    end
  end

  def new

  end

  def create
    City.create!(city_params)
    redirect_to '/cities'
  end

  def edit
    @city= City.find(params[:id])
  end

  def update
    city = City.find(params[:id])
    city.update(city_params)
    redirect_to "/cities/#{city.id}"
  end

  private
  def city_params
    params.permit(:name, :population, :metropolis)
  end
end