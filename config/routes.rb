Rails.application.routes.draw do
  post 'restaurants/find' => 'restaurants#find', :as =>'restaurants'
  get 'restaurants/show' => 'restaurants#show', :as => 'restaurants_show'
  post 'restaurants/favourite' => 'restaurants#favourite', :as => 'restaurant_favourite'
  get 'restaurants/favourites' => 'restaurants#showfavourites', :as => 'show_favourites'

  resources :autocompletes
  resources :favourites
  root to: 'autocompletes#new'

  #renders a form in the browser
  get '/signup' => 'users#new'
  #receive the form and create the user in the db
  post '/users/create' => 'users#create'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new', :as => 'new_session'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
