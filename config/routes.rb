Rails.application.routes.draw do
  devise_for :users
  root to: 'topics#index'
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
      get 'comment'
      get 'search_self'
    end
    resources :likes, only: [:create, :destroy]
    resources :bads, only: [:create, :destroy]
  end
  resources :users, only: [:show,:edit,:destroy,:new]
end
