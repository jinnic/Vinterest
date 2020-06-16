Rails.application.routes.draw do

  resources :boards
  resources :videos
  resources :users, only: [:new, :create, :edit]
  get 'welcome', to: 'sessions#welcome'
  


  delete 'logout', to: 'sessions#destroy'
  get 'login', to: 'sessions#new'
  get 'home', to: 'sessions#page_requires_login'
  post 'login', to: 'sessions#create'
  
  get 'authorized', to: 'sessions#page_requires_login'
  delete 'logout', to: 'sessions#destroy'
  get ':username', to: 'users#show', as: :user

  root 'videos#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
