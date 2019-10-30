Rails.application.routes.draw do
  patch 'restaurants/find' => 'restaurants#find', :as =>'restaurants'
  get 'restaurants/find' => 'restaurants#find'
  # resources :restaurants

  resources :autocompletes
  root to: 'autocompletes#new'
  #root to: 'pages#welcome'

  #renders a form in the browser
  get '/signup' => 'users#new'
  #receive the form and create the user in the db
  post '/users/create' => 'users#create'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new', :as => 'new_session'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'






end


# # these routes are for showing users a login form, logging them in, and logging them out.
# get '/login' => 'sessions#new'
# post '/login' => 'sessions#create'
# get '/logout' => 'sessions#destroy'
#
# get '/signup' => 'users#new'
# post '/users' => 'users#create'