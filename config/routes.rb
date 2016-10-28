Rails.application.routes.draw do

  root :to => 'users#index'  

  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :line_items

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
