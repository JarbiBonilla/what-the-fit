Rails.application.routes.draw do

  get 'auth/facebook/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')

  root 'sessions#home'
  #where a trainer signs up
  get '/signup', to: 'trainers#new'
  post '/signup', to: 'trainers#create'
  #where a trainer logs in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #logout route
  delete '/logout', to: 'sessions#destroy'

  get '/search', to: 'clients#search'

  resources :clients, except: [:index]
  resources :appointments, except: [:new, :index]

  resources :trainers do
    resources :clients, only: [:index, :new, :create]
  end

  
  resources :clients do 
    resources :appointments, only: [:new, :index]
  end

end
