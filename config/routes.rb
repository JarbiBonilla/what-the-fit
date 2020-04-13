Rails.application.routes.draw do
  get 'trainers/signup', to: 'trainers#new'
  post 'trainers/signup', to: 'trainers#create'

  resources :trainers do
    resources :clients
  end

  resources :clients do 
    resources :appointments, only: [:new]
  end


end
