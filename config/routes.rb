Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
  resources :topics, only: [:index,:new,:create,:show,:destroy] do
    resources :comments, only: [:new, :create]
  end
  resources :users, only: [:show,:edit,:destroy,:new]
end
