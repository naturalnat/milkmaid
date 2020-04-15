Rails.application.routes.draw do

  get '/', to: 'sessions#welcome'
  get '/login', to: 'users#new'
  post '/login', to: 'users#create'
  get '/signup', to: 'sessions#signup'
  post '/signup', to: 'sessions#signup'
  resources :milks
  resources :orders
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
