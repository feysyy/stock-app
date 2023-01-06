Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # devise_scope :user do
  #   root to: 'devise/sessions#new'
  # end
  get "/home", to: "home#index"

  root "home#index"
  # Defines the root path route ("/")
  # root "articles#index"
  namespace :admin do
    resources :users
  end

  get '/portfolio', to: "portfolio#display", as: 'portfolio_display'
  get '/marketplace', to: 'marketplace#display', as: 'marketplace_display'
  post '/marketplace/add', to: 'stocks#create', as: 'add_stock'
  get '/portfolio/stock/:symbol', to: 'portfolio#show_stock', as: 'show_stock'
  post '/stock/:id/new_order', to: 'orders#create', as: 'order_stock'
end
