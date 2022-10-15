require 'rails_helper'

RSpec.describe City, type: :model do
  before :each do
    @braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
    @atlanta = City.create!(name:'Atlanta', population:49762, metropolis:true)
    @fogo = @atlanta.restaurants.create!(name: 'Fodo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
    @jacks = @braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)
  end
  
  describe 'validations' do
    it {should have_many :restaurants}
  end

  describe '#restaurant_count' do
    it 'counts the restaurants' do
      expect(@braselton.restaurant_count).to eq(1)
    end
  end
end