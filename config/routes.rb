Rails.application.routes.draw do

  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  resources :milks
  resources :orders
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
