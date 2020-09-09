Rails.application.routes.draw do

  root 'videos#index'
  get '/add_video/:id', to: 'videos#search_new', as: :add_search_video
  resources :videos
  get 'video/:id', to: 'videos#delete_img', as: :delete_video
  
  
  get '/search', to: 'videos#search'
  
  get 'welcome', to: 'sessions#welcome'
  


  get 'logout', to: 'sessions#logout'
  get 'login', to: 'sessions#new'
  get 'home', to: 'sessions#page_requires_login'
  post 'login', to: 'sessions#create'
  
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  
  resources :boards
  resources :users , only: [:new, :create]
  get ':username/edit', to: 'users#edit', as: :edit_user
  patch 'users/:id', to: 'users#update', as: :update_user

  get ':username', to: 'users#show', as: :user
  
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
