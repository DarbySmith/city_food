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
    expect(page).to have_selector(:css, 'a[href="/restaurants"]')
    expect(page).to have_selector(:css, 'a[href="/cities"]')
  end
  
  it 'shows the count of restaurants for the city' do
    visit "/cities/#{@braselton.id}"
  
    expect(page).to have_content(@braselton.restaurant_count)
  end

  it 'has a link to update the city' do
    hoschton = City.create!(name: 'Hoshton', population: 12450, metropolis:false) 
    visit "/cities/#{hoschton.id}"

    click_link "Edit City"

    expect(current_path).to eq("/cities/#{hoschton.id}/edit")

    fill_in "Name", with: "Hoschton"
    fill_in "Population", with: 12450
    fill_in "Metropolis", with: false

    click_on "Update City"

    expect(current_path).to eq("/cities/#{hoschton.id}")
    expect(page).to have_content("Hoschton")
  end

  it 'has a link to delete the city' do
    hoschton = City.create!(name: 'Hoschton', population: 12450, metropolis:false) 
    
    visit "/cities/#{hoschton.id}"

    click_button "Delete"

    expect(current_path).to eq("/cities")
    expect(page).to_not have_content(hoschton.name)
  end
end