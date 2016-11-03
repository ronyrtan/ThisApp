Rails.application.routes.draw do

  root :to => 'items#index'
  get 'items/show_category/:category' => 'items#show_category', :as => 'item_category'
  post 'line_item/:id' => 'line_items#create', :as => 'line_item_create'
  # post '/add_to_cart/:item_id' => 'carts#add_to_cart', :as => 'add_to_cart'
  get '/add_to_cart/:item_id/:qty' => 'carts#add_to_cart', :as => 'add_to_cart'
  post '/add_to_wishlist/:item_id' => 'wishlists#add_to_wishlist', :as => 'add_to_wishlist'
  # get '/add_to_wishlist/:item_id' => 'wishlists#add_to_wishlist', :as => 'add_to_wishlist'

  get 'carts/payment' => 'carts#payment'
  get 'carts/processing' => 'carts#cart_processing'
  get 'order/complete' => 'orders#order_complete'

  resources :users
  resources :items
  resources :carts
  resources :orders
  resources :line_items
  resources :wishlists, :only => [:create, :show, :destroy]

  get '/login' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
