Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/cities', to: 'cities#index'
  get '/cities/new', to: 'cities#new'
  get '/cities/:id', to: 'cities#show'
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show'
  get '/cities/:id/restaurants', to: 'cities#city_restaurant_index'
  post '/cities', to: 'cities#create'
  get '/cities/:id/edit', to: 'cities#edit'
  patch '/cities/:id/edit', to: 'cities#update'
end
