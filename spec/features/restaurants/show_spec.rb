require 'rails_helper'

RSpec.describe 'shows index of a city' do
  it 'shows a city with attributes' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    fogo = atlanta.restaurants.create!(name: 'Fodo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    jacks = braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)

    visit "/restaurants/#{fogo.id}"

    expect(page).to have_content(fogo.name)
    expect(page).to have_content(fogo.food_type)
    expect(page).to have_content(fogo.alcohol_served)
    expect(page).to have_content(fogo.rating)
    expect(page).to have_content(fogo.city.name)
    expect(page).to have_selector(:css, 'a[href="/restaurants"]')
    expect(page).to have_selector(:css, 'a[href="/cities"]')
  end

  it 'has a link to update the restaurant details' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    fogo = atlanta.restaurants.create!(name: 'Fodo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    jacks = braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)

    visit "/restaurants/#{fogo.id}"

    click_link "Update Restaurant"

    expect(current_path).to eq("/restaurants/#{fogo.id}/edit")
    fill_in :name, with: 'Fogo de Chao'
    fill_in :food_type, with: 'steakhouse'
    fill_in :alcohol_served, with: true
    fill_in :rating, with: 5
    click_button 'Update Restaurant'

    expect(current_path).to eq("/restaurants/#{fogo.id}")
    expect(page).to have_content("Fogo de Chao")
  end
end