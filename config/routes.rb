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
end
