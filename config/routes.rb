Rails.application.routes.draw do

  #where a trainer signs up
  get '/signup', to: 'trainers#new'
  post '/signup', to: 'trainers#create'

  #where a trainer logs in
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  #logout route
  delete '/logout', to: 'sessions#destroy'


  resources :trainers do
    resources :clients, only: [:new, :create, :index, :show]
  end

  resources :clients do 
    resources :appointments, only: [:new, :create, :index, :show]
  end


end
