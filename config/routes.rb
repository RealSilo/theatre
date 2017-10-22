Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :events
  resource :shopping_cart
  resources :payments

  get "paypal/approved", to: "paypal_payments#approved"
end
