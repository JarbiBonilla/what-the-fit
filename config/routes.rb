Rails.application.routes.draw do

  #where a trainer signs up
  get 'trainers/signup', to: 'trainers#new'
  post 'trainers/signup', to: 'trainers#create'

  #where a trainer logs in
  get '/trainers/login', to: 'sessions#new'
  post '/trainers/login', to: 'sessions#create'

  #logout route
  delete 'trainers/logout', to: 'sessions#destroy'
  

  resources :trainers do
    resources :clients
  end

  resources :clients do 
    resources :appointments, only: [:new]
  end


end
