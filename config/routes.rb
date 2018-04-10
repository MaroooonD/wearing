Rails.application.routes.draw do
  get 'all_posts/index'

  root to: 'toppages#index'
  
  #root to: 'picture_stores#index'
  resources :picture_stores
  resources :stores
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  resources :rankings, only: [:index, :show]
  
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create, :edit, :update] do
    member do
      get :followings
      get :followers
      
      get :likings
    end
  end
  
  resources :posts, only: [:index, :show, :create, :destroy]
  resources :all_posts, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :favorites,only: [:create, :destroy]
  resources :comments, only: [:index,:create,:destroy]
  resources :photos
end