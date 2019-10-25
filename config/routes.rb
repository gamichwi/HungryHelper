Rails.application.routes.draw do
  resources :autocomplettes
  root to: 'pages#welcome'

  #renders a form in the browser
  get '/signup' => 'users#new'
  #receive the form and create the user in the db
  post '/users/create' => 'users#create'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
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