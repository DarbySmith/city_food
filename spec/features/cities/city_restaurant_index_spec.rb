require 'rails_helper'

RSpec.describe 'shows index of restaurants for a city' do
  it 'shows shows restaurants for a city' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    fogo = atlanta.restaurants.create!(name: 'Fogo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    jacks = braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)

    visit "/cities/#{atlanta.id}/restaurants"

    expect(page).to have_content(fogo.name)
    expect(page).to have_content(fogo.food_type)
    expect(page).to have_content(fogo.alcohol_served)
    expect(page).to have_content(fogo.rating)
    expect(page).to have_selector(:css, 'a[href="/restaurants"]')
    expect(page).to have_selector(:css, 'a[href="/cities"]')

    expect(page).not_to have_content(jacks.name)
  end
end