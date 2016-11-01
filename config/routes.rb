Rails.application.routes.draw do

  root :to => 'users#index'
  get 'items/show_category/:category' => 'items#show_category', :as => 'item_category'
  post 'line_item/:id' => 'line_items#create', :as => 'line_item_create'
  post '/add_to_cart/:item_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  get 'carts/payment' => 'carts#payment'
  get 'order/complete' => 'orders#order_complete'

  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :line_items

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
