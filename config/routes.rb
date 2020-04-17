Rails.application.routes.draw do
  root 'sessions#home'
  #where a trainer signs up
  get '/signup', to: 'trainers#new'
  post '/signup', to: 'trainers#create'
  #where a trainer logs in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #logout route
  delete '/logout', to: 'sessions#destroy'

  resources :clients, except: [:index]
  resources :appointments, except: [:new, :index]

  resources :trainers do
    resources :clients, only: [:index]
  end

  
  resources :clients do 
    resources :appointments, only: [:new, :index]
  end

end
