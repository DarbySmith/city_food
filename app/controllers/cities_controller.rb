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
    if params[:search]
      @city_restaurants = show.restaurants.where('rating >= ?', params[:search])
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

  def destroy
    City.destroy(params[:id])
    redirect_to "/cities"
  end

  private
  def city_params
    params.permit(:name, :population, :metropolis, :search)
  end
end