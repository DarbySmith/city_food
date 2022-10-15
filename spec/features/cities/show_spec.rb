require 'rails_helper'

RSpec.describe 'shows index of a city' do
  before :each do 
    @braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    @atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    @fogo = @atlanta.restaurants.create!(name: 'Fogo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    @jacks = @braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)
  end

  it 'shows a city with attributes' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)

    visit "/cities/#{braselton.id}"

    expect(page).to have_content(braselton.name)
    expect(page).to have_content(braselton.population)
    expect(page).to have_content(braselton.metropolis)
  end

  it 'shows the count of restaurants for the city' do
    visit "/cities/#{@braselton.id}"

    expect(page).to have_content(@braselton.name)
    expect(page).to have_content(@braselton.population)
    expect(page).to have_content(@braselton.metropolis)
    expect(page).to have_content(@braselton.restaurant_count)
  end
end