class CitiesController < ApplicationController
  def index
    @cities = ['Denver', 'Cleveland', 'Braselton']
  end
end