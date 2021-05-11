Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :topics, only: [:index,:new,:create,:show,:destroy]
  resources :users, only: [:show,:edit,:destroy]
end
