require 'rails_helper'

RSpec.describe 'shows index of all cities' do
  it 'shows all cities' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)

    visit '/cities'

    expect(page).to have_content(braselton.name)
    expect(page).to have_content(atlanta.name)
  end

  it 'shows cities in order of most recent created first' do
    braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)

    visit '/cities'

    # this = find('.this')
    # that = find('.that')

    expect(braselton.name).to appear_before(atlanta.name)
  end
end