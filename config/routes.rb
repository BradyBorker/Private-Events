Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'events#index'
  resources :events
  resources :users, only: :show
  resources :attended_events, only: [:new, :create, :destroy]
end
