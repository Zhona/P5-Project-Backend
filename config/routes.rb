Rails.application.routes.draw do
  resources :categories
  resources :products
  resources :orders
  resources :creditcards
  resources :cart_items
  resources :users #, only: [:create]

  post '/auth/login', to: "auth#login"
  get '/name', to: "users#name"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
