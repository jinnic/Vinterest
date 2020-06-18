Rails.application.routes.draw do

  # root 'videos#index'
  # resources :videos
  
  # # get 'welcome', to: 'sessions#welcome'
  


  # delete 'logout', to: 'sessions#destroy'
  # get 'logout', to: 'sessions#destroy'
  # get 'login', to: 'sessions#new'
  # get 'home', to: 'sessions#page_requires_login'
  # post 'login', to: 'sessions#create'
  
  # get 'authorized', to: 'sessions#page_requires_login'
  
  # resources :boards

  # get ':username/edit', to: 'users#edit', as: :edit_user
  
  

  # patch 'users/:id', to: 'users#update', as: :update_user
  # resources :users , only: [:new, :create]
  
  
  
  
  # get 'users/:username', to: 'users#show', as: :user
  



  root to: 'videos#index'
  resources :boards
  resources :videos
  
  resources :users, only: [:new, :create, :edit]
  patch 'users/:id', to: 'users#update', as: :update_user
  get 'welcome', to: 'sessions#welcome'

  get 'search', to: 'videos#search', as: :search
  get 'logout', to: 'sessions#logout'
  get 'login', to: 'sessions#new'
  get 'home', to: 'sessions#page_requires_login'
  post 'login', to: 'sessions#create'

  get 'authorized', to: 'sessions#page_requires_login'
  
  get ':username', to: 'users#show', as: :user

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
