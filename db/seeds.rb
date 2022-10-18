# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
atlanta = City.create!(name:'Atlanta', population:497642, metropolis:true)
fogo = atlanta.restaurants.create!(name: 'Fogo de Chao', food_type: 'steak house', alcohol_served: true, rating: 5)
south_city = atlanta.restaurants.create!(name: 'South City Kitchen', food_type: 'Southern', alcohol_served: true, rating: 4)
varsity = atlanta.restaurants.create!(name: 'The Varsity', food_type: 'Burgers', alcohol_served: false, rating: 2)


braselton = City.create!(name:'Braselton', population:12178, metropolis:false)
jacks = braselton.restaurants.create!(name: 'Jacks Public House', food_type:'American', alcohol_served: true, rating: 5)
roman = braselton.restaurants.create!(name: 'The Roman Oven', food_type:'Italian', alcohol_served: false, rating: 4)
ninja = braselton.restaurants.create!(name: 'Ninja', food_type:'Sushi', alcohol_served: true, rating: 4)


denver = City.create!(name:'Denver', population:715878, metropolis:true)
biscuit = denver.restaurants.create!(name: 'Denver Biscuit Company', food_type:'Breakfast', alcohol_served: true, rating: 4)
jax = denver.restaurants.create!(name: 'Jax Fish House', food_type:'Seafood', alcohol_served: false, rating: 5)
rioja = denver.restaurants.create!(name: 'Rioja', food_type:'Mediterranean', alcohol_served: true, rating: 4)


missoula = City.create!(name:'Missoula', population:74994, metropolis:false)
rice = missoula.restaurants.create!(name: 'Rice Fine Thai Cuisine', food_type:'Thai', alcohol_served: false, rating: 3)
bagels = missoula.restaurants.create!(name: 'Bagels on Broadway', food_type:'Cafe', alcohol_served: false, rating: 4)
front = missoula.restaurants.create!(name: 'Front St. Pizza', food_type:'Pizza', alcohol_served: true, rating: 5)

chicago = City.create!(name:'Chicago', population: 2105487, metropolis:true)
pasta = chicago.restaurants.create!(name: 'The Pasta Bowl', food_type:'Italian', alcohol_served: true, rating: 5)
bbq = chicago.restaurants.create!(name: 'City Barbeque', food_type:'Barbeque', alcohol_served: false, rating: 3)
jeong = chicago.restaurants.create!(name: 'Jeong', food_type:'Korean', alcohol_served: true, rating: 5)
