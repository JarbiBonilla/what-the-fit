Rails.application.routes.draw do
  get 'trainers/signup', to: 'trainers#new'
  post 'trainers/signup', to: 'trainers#create'

  resources :trainers

end
