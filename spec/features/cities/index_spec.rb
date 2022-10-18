require 'rails_helper'

RSpec.describe 'shows index of all cities' do
  it 'shows all cities' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)

    visit '/cities'

    expect(page).to have_content(braselton.name)
    expect(page).to have_content(atlanta.name)
    expect(page).to have_selector(:css, 'a[href="/restaurants"]')
    expect(page).to have_selector(:css, 'a[href="/cities"]')
  end

  it 'shows cities in order of most recent created first' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:497642, metropolis:true)

    visit '/cities'

    # this = find('.this')
    # that = find('.that')

    expect(atlanta.name).to appear_before(braselton.name)
  end

  it 'has a link to create new cities on cities index' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:497642, metropolis:true)

    visit '/cities'

    click_link 'New City'

    expect(current_path).to eq('/cities/new')
    fill_in "Name", with: 'Charleston'
    fill_in "Population", with: 137041
    fill_in "Metropolis", with: true
    
    click_on 'Create City'
    
    expect(current_path).to eq("/cities")
    expect(page).to have_content("Charleston")
  end

  it 'has a link to update a city' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:497642, metropolis:true)

    visit '/cities'

    click_link "Update #{braselton.name}"

    expect(current_path).to eq("/cities/#{braselton.id}/edit")
    fill_in :name, with: 'Braselton'
    fill_in :population, with: 12148
    fill_in :metropolis, with: false

    click_on "Update City"
    
    expect(current_path).to eq("/cities/#{braselton.id}")
    expect(page).to have_content(12148)
    expect(page).to_not have_content(12178)
  end

  it 'has a link to take to the show page' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:497642, metropolis:true)
    
    visit "/cities"

    click_link "More info on #{braselton.name}"

    expect(current_path).to eq("/cities/#{braselton.id}")
    expect(page).to have_content(12178)
    expect(page).to have_content(false)
  end

  it 'has a button to delete a city' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:497642, metropolis:true)

    visit "/cities"

    click_button "Delete #{braselton.name}"

    expect(current_path).to eq("/cities")
    expect(page).to_not have_content(braselton.name)
  end
end