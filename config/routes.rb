Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'signup', to: 'users#new'
  get 'login', to: 'session#new'
  post 'login', to: 'session#create'
  get 'logout', to: 'session#destroy'

  resources :users, only:[:new, :create, :edit, :update]
  resources :books, only:[:new]
  resources :buy, only:[:new]
  
end
