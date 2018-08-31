Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
  root 'users#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/logout', to: 'sessions#destroy'

  resources :users
end
