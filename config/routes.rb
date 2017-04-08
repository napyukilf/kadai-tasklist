Rails.application.routes.draw do
 #get 'toppages/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  root to: 'toppages#index'
  # root to: 'tasks#index'
  # resources :tasks
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
end