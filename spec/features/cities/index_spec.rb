require 'rails_helper'

RSpec.describe 'shows index of all cities' do
  it 'shows all cities' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)

    visit '/cities'

    expect(page).to have_content(braselton.name)
    expect(page).to have_content(atlanta.name)
  end
end