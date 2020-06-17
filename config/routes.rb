Rails.application.routes.draw do

  
  resources :videos
  
  get 'welcome', to: 'sessions#welcome'
  


  delete 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  get 'home', to: 'sessions#page_requires_login'
  post 'login', to: 'sessions#create'
  
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  
  resources :boards

  get ':username/edit', to: 'users#edit', as: :edit_user
  get ':username', to: 'users#show', as: :user
  

  patch 'users/:id', to: 'users#update', as: :update_user
  resources :users , only: [:new, :create]
  root 'videos#index'

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
