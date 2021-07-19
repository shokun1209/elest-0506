Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :users, only: [:show,:edit,:destroy,:new]
  resources :topics, only: [:index,:new,:create,:show,:destroy] do
    resources :comments, only: [:new, :create,:destroy]
    collection do
      get 'arena'
      get 'gran'
      get 'event'
      get 'gacha'
      get 'doxing'
      get 'team'
      get 'other'
      get 'search_self'
    end
    resource :like, only: [:create, :destroy]
    resource :bad, only: [:create, :destroy]
    resources :notifications, only: [:index, :destroy]
  end
end
