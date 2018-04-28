Rails.application.routes.draw do

  root to: 'toppages#index'
  
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
  
  resources :all_posts, only: [:index]
  resources :relationships, only: [:create, :destroy]
  resources :favorites,only: [:create, :destroy]
  resources :comments, only: [:index,:create,:destroy]
  resources :photos
  
  
  resources :posts, only: [:index, :new, :create, :destroy, :show] do
    resources :comments,only: [:new,:create,:destroy]
  end
end