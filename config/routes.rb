Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :topics, only: [:index,:new,:create,:show,:destroy] do
    resources :comments, only: [:new, :create,:destroy]
    resources :likes, only: [:create, :destroy]
    resources :bads, only: [:create, :destroy]
  end
  resources :users, only: [:show,:edit,:destroy,:new]
end
