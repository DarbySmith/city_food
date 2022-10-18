require 'rails_helper'

RSpec.describe 'shows index of all restaurants' do
  it 'shows all restaurants' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    fogo = atlanta.restaurants.create!(name: 'Fogo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    jacks = braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)

    visit '/restaurants'

    expect(page).to have_content(fogo.name)
    expect(page).to have_content(fogo.food_type)
    expect(page).to have_content(fogo.alcohol_served)
    expect(page).to have_content(fogo.rating)
    expect(page).to have_content(fogo.city.name)
    expect(page).to have_content(jacks.name)
    expect(page).to have_content(jacks.food_type)
    expect(page).to have_content(jacks.alcohol_served)
    expect(page).to have_content(jacks.rating)
    expect(page).to have_content(jacks.city.name)
    expect(page).to have_selector(:css, 'a[href="/restaurants"]')
    expect(page).to have_selector(:css, 'a[href="/cities"]')
  end

  it 'shows only the restaurants that serve alchol' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    fogo = atlanta.restaurants.create!(name: 'Fogo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    jacks = braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)

    visit "/restaurants"

    expect(page).to have_content("Jacks Public House")
    expect(page).to have_content("Fogo de Chao")

    expect(page).to_not have_content("Zaxbys")
  end

  it 'has a link to update the restaurant' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    fogo = atlanta.restaurants.create!(name: 'Fogo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    jacks = braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)

    visit "/restaurants"

    click_link "Update #{fogo.name}"

    expect(current_path).to eq("/restaurants/#{fogo.id}/edit")
    fill_in :name, with: "Fogo de Chao"
    fill_in :food_type, with: "Steakhouse"
    fill_in :alcohol_served, with: true
    fill_in :rating, with: 5

    click_on "Update Restaurant"

    expect(current_path).to eq("/restaurants/#{fogo.id}")
    expect(page).to have_content("Steakhouse")
    expect(page).to_not have_content("steak house")
  end
end