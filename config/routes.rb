Rails.application.routes.draw do
  
  get 'order/index'
  get '/', to: 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#create'

  resources :milks
  resources :orders
  resources :reviews
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
