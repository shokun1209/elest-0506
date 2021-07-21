Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root to: 'topics#index'
  resources :users, only: [:show,:edit,:destroy,:new]
  resources :topics do
    resources :comments, only: [:new, :create,:destroy,:edit,:update]
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
