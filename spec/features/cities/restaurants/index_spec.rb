# User Story 10, Parent Child Index Link

# As a visitor
# When I visit a parent show page ('/parents/:id')
# Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

require 'rails_helper'

RSpec.describe 'Restaurant in city' do  
  before :each do 
    @braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    @atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    @fogo = @atlanta.restaurants.create!(name: 'Fogo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    @jacks = @braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)
    @zaxbys = @braselton.restaurants.create!(name: 'Zaxbys', food_type: 'chicken', alcohol_served: false, rating: 5)
  end
  
  it 'shows a link to restaurants in that city' do
    visit "/cities/#{@braselton.id}"
    
    click_button "Restaurants in #{@braselton.name}"
    expect(current_path).to eq("/cities/#{@braselton.id}/restaurants")
  end
  
  it 'shows a link to add a new restaurant to the city' do
    visit "/cities/#{@braselton.id}/restaurants"
    
    click_link "Add New Restaurant"

    expect(current_path).to eq("/cities/#{@braselton.id}/restaurants/new")
    fill_in :name, with: 'Cotton Calf'
    fill_in :food_type, with: 'Steakhouse'
    fill_in :alcohol_served, with: true
    fill_in :rating, with: 5

    click_on "Create Restaurant"
    expect(current_path).to eq("/cities/#{@braselton.id}/restaurants")
    expect(page).to have_content("Cotton Calf")
  end

  it 'shows only the restaurants that serve alchol' do
    visit "/restaurants"

    expect(page).to have_content("Jacks Public House")
    expect(page).to have_content("Fogo de Chao")

    expect(page).to_not have_content("Zaxbys")
  end
end