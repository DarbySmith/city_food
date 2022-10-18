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
    @zaxbys = @braselton.restaurants.create!(name: 'Zaxbys', food_type: 'chicken', alcohol_served: false, rating: 5)
    @jacks = @braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)
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

  it 'shows a link to alphabetize restaurants name' do
    visit "/cities/#{@braselton.id}/restaurants"

    click_link "Sort by name"

    expect(current_path).to eq("/cities/#{@braselton.id}/restaurants")
    expect(@jacks.name).to appear_before(@zaxbys.name)
  end

  it 'shows a link to update a restaurant in that city' do
    visit "/cities/#{@atlanta.id}/restaurants"

    click_link "Update #{@fogo.name}"

    expect(current_path).to eq("/restaurants/#{@fogo.id}/edit")
    fill_in :name, with: "Fogo de Chao"
    fill_in :food_type, with: "Steakhouse"
    fill_in :alcohol_served, with: true
    fill_in :rating, with: 5

    click_on "Update Restaurant"

    expect(current_path).to eq("/restaurants/#{@fogo.id}")
    expect(page).to have_content("Steakhouse")
    expect(page).to_not have_content("steak house")
  end

  it 'has a form that allows to filter the restaurants' do
    marg = @braselton.restaurants.create!(name: 'Las Margaritas', food_type:'Mexican', alcohol_served: true, rating: 3)
    
    visit "/cities/#{@braselton.id}/restaurants"

    fill_in :search, with: 4

    click_on "Submit"

    expect(current_path).to eq("/cities/#{@braselton.id}/restaurants")
    expect(page).to_not have_content(marg.name)
  end
end