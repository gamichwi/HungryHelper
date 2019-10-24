Rails.application.routes.draw do
  root to: 'pages#welcome'

  #renders a form in the browser
  get '/signup' => 'users#new'
  #receive the form and create the user in the db
  get '/users' => 'users#create'

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
