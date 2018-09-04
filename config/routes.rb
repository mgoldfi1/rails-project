Rails.application.routes.draw do
  get '/auth/facebook/callback' => 'sessions#create'
  root 'users#home'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#login'

  get '/signup', to: 'users#new'
  post '/users', to: 'users#create'

  get '/logout', to: 'sessions#destroy'

  post '/buyticket', to: 'showings#buy'

  post '/refund', to: 'showings#cancel'
  resources :users, only: [:show, :new, :create] do
    resources :showings, only: [:show, :index, :new]
  end
end
