require 'rails_helper'

RSpec.describe 'shows index of a city' do
  it 'shows a city with attributes' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)

    visit "/cities/#{braselton.id}"

    expect(page).to have_content(braselton.name)
    expect(page).to have_content(braselton.population)
    expect(page).to have_content(braselton.metropolis)
  end
end